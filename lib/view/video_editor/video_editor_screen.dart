import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/view/create_post/channel/upload_new_post.dart';
import 'package:stellar_chat/view/create_post/flicks/flicks_upload_new_post/upload_new_post.dart';
import 'package:stellar_chat/view/video_editor/crop_page.dart';
import 'package:stellar_chat/view/video_editor/export_service.dart';
import 'package:stellar_chat/view/video_editor/video_filter/video_filter_home.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:video_editor/video_editor.dart';

class VideoEditorHomeScreen extends StatefulWidget {
  const VideoEditorHomeScreen(
      {super.key, required this.file, required this.isFromChannel});
  final bool isFromChannel;

  final File file;

  @override
  State<VideoEditorHomeScreen> createState() => _VideoEditorHomeScreenState();
}

class _VideoEditorHomeScreenState extends State<VideoEditorHomeScreen> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  late final VideoEditorController _controller = VideoEditorController.file(
    widget.file,
    minDuration: const Duration(seconds: 1),
    maxDuration: const Duration(seconds: 60),
  );

  @override
  void initState() {
    super.initState();
    _controller
        .initialize(aspectRatio: 9 / 16)
        .then((_) => setState(() {}))
        .catchError((error) {
      // handle minumum duration bigger than video duration error
      Navigator.pop(context);
    }, test: (e) => e is VideoMinDurationError);
  }

  @override
  void dispose() async {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    ExportService.dispose();
    super.dispose();
  }

  void _showErrorSnackBar(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
      );

  void _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;

    final config = VideoFFmpegVideoEditorConfig(
      _controller,
    );

    await ExportService.runFFmpegCommand(
      await config.getExecuteConfig(),
      onProgress: (stats) {
        _exportingProgress.value = config.getFFmpegProgress(
          stats.getTime().toInt(),
        );
      },
      onError: (e, s) => _showErrorSnackBar("Error on export video :("),
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;
        Get.to(() => VideoFilterHomeScreen(
              videoPath: file.path,
              isFromChannel: widget.isFromChannel,
            ));

        // showDialog(
        //   context: context,
        //   builder: (_) => VideoResultPopup(video: file),
        // );
      },
    );
  }

  // void _exportCover() async {
  //   final config = CoverFFmpegVideoEditorConfig(_controller);
  //   final execute = await config.getExecuteConfig();
  //   if (execute == null) {
  //     _showErrorSnackBar("Error on cover exportation initialization.");
  //     return;
  //   }

  //   await ExportService.runFFmpegCommand(
  //     execute,
  //     onError: (e, s) => _showErrorSnackBar("Error on cover exportation :("),
  //     onCompleted: (cover) {
  //       if (!mounted) return;

  //       showDialog(
  //         context: context,
  //         builder: (_) => CoverResultPopup(cover: cover),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Set this height
        child: Container(
            height: 100,
            color: const Color.fromRGBO(159, 196, 232, 1),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.string(
                        """<svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                  <path d="M7.5 14L1 7.5L7.5 1" stroke="black" stroke-width="2" stroke-linejoin="round"/>
                                  </svg>
                                  """),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _exportVideo,
                    child: Row(
                      children: [
                        const Text(
                          "Next",
                          style:
                              TextStyle(color: Color.fromRGBO(0, 51, 142, 1)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.string(
                            """<svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1 1L7.5 7.5L1 14" stroke="black" stroke-width="2" stroke-linejoin="round"/>
                  </svg>
                  """),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      body: _controller.initialized
          ? SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      _topNavBar(),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CropGridViewer.preview(
                                            controller: _controller),
                                        AnimatedBuilder(
                                          animation: _controller.video,
                                          builder: (_, __) => AnimatedOpacity(
                                            opacity:
                                                _controller.isPlaying ? 0 : 1,
                                            duration: kThemeAnimationDuration,
                                            child: GestureDetector(
                                              onTap: _controller.video.play,
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CoverViewer(controller: _controller)
                                  ],
                                ),
                              ),
                              Container(
                                height: 200,
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Icon(Icons.content_cut)),
                                            Text(
                                              'Trim',
                                              style: TextStyle(
                                                  color: Get.find<
                                                              ThemeController>()
                                                          .isDarkTheme
                                                          .value
                                                      ? Colors.white
                                                      : Colors.black),
                                            )
                                          ]),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: _trimSlider(),
                                          ),
                                          _coverSelection(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: _isExporting,
                                builder: (_, bool export, Widget? child) =>
                                    AnimatedSize(
                                  duration: kThemeAnimationDuration,
                                  child: export ? child : null,
                                ),
                                child: AlertDialog(
                                  title: ValueListenableBuilder(
                                    valueListenable: _exportingProgress,
                                    builder: (_, double value, __) => Center(
                                      child: Text(
                                        "Processing video ${(value * 100).ceil()}%",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _topNavBar() {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            // Expanded(
            //   child: IconButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     icon: const Icon(Icons.arrow_back_outlined),
            //     tooltip: 'Leave editor',
            //   ),
            // ),
            const VerticalDivider(endIndent: 22, indent: 22),
            Expanded(
              child: IconButton(
                onPressed: () =>
                    _controller.rotate90Degrees(RotateDirection.left),
                icon: const Icon(Icons.rotate_left),
                tooltip: 'Rotate unclockwise',
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () =>
                    _controller.rotate90Degrees(RotateDirection.right),
                icon: const Icon(Icons.rotate_right),
                tooltip: 'Rotate clockwise',
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => CropPage(controller: _controller),
                  ),
                ),
                icon: const Icon(Icons.crop),
                tooltip: 'Open crop screen',
              ),
            ),
            const VerticalDivider(endIndent: 22, indent: 22),
          ],
        ),
      ),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _controller.video,
        ]),
        builder: (_, __) {
          final int duration = _controller.videoDuration.inSeconds;
          final double pos = _controller.trimPosition * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(children: [
              Text(
                formatter(Duration(
                  seconds: pos.toInt(),
                )),
              ),
              const Expanded(child: SizedBox()),
              AnimatedOpacity(
                opacity: _controller.isTrimming ? 1 : 0,
                duration: kThemeAnimationDuration,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatter(_controller.startTrim),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      formatter(_controller.endTrim),
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: height / 4),
        child: TrimSlider(
          controller: _controller,
          height: height,
          horizontalMargin: height / 4,
          child: TrimTimeline(
            controller: _controller,
            padding: const EdgeInsets.only(top: 10),
          ),
        ),
      )
    ];
  }

  Widget _coverSelection() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: CoverSelection(
            controller: _controller,
            size: height + 10,
            quantity: 8,
            selectedCoverBuilder: (cover, size) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  cover,
                  Icon(
                    Icons.check_circle,
                    color: const CoverSelectionStyle().selectedBorderColor,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
