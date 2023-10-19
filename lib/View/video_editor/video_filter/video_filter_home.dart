import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/create_post/channel/upload_new_post.dart';
import 'package:stellar_chat/View/create_post/flicks/flicks_upload_new_post/upload_new_post.dart';
import 'package:stellar_chat/View/video_editor/video_filter/filters/filters_generated.dart';
import 'package:stellar_chat/controllers/filter_controller.dart';
import 'package:video_player/video_player.dart';

class VideoFilterHomeScreen extends StatefulWidget {
  final String videoPath;
  final bool isFromChannel;
  const VideoFilterHomeScreen(
      {super.key, required this.videoPath, required this.isFromChannel});

  @override
  State<VideoFilterHomeScreen> createState() => _VideoFilterHomeScreenState();
}

class _VideoFilterHomeScreenState extends State<VideoFilterHomeScreen> {
  final VideoController videoController = Get.put(VideoController());
  late VideoPlayerController videoPlayerController;
  List<String> filterList = [
    "Normal",
    "B & W",
    "Vintage",
    "Grey Scale",
    "Sepial"
  ];
  @override
  void initState() {
    super.initState();

    videoController.setVideoPath(widget.videoPath);
  }

  bool isApplyingFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Set this height
        child: Container(
            height: 80,
            color: const Color.fromRGBO(159, 196, 232, 1),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
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
                    onTap: () async {
                      if (widget.isFromChannel) {
                        Get.to(
                          () => ChannelUploadNewPost(
                            path: videoController.videoPath.value,
                          ),
                        );
                        return;
                      }
                      Get.to(
                        () => FlicksUploadNewPost(
                          path: videoController.videoPath.value,
                        ),
                      );
                    },
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
      body: Column(
        children: [
          Container(
            height: Get.height * 0.7,
            width: Get.width,
            decoration: const BoxDecoration(color: Colors.red),
            child: VideoPlayerWidget(),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: Get.height * 0.15,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 5,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Text(
                    filterList[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(index);
                      if (index == 0) {
                        applyNormalColor(widget.videoPath);
                      }
                      if (index == 1) {
                        applyBlackAndWhiteFilterUsingFFmpeg(widget.videoPath);
                      }
                      if (index == 2) {
                        applyVintageFilterUsingFFmpeg(widget.videoPath);
                      }
                      if (index == 3) {
                        applyGrayscaleFilterUsingFFmpeg(widget.videoPath);
                      }
                      if (index == 4) {
                        applySepiaFilterUsingFFmpeg(widget.videoPath);
                      }
                    },
                    child: Container(
                      height: Get.height * 0.12,
                      width: Get.height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoController videoController = Get.find();

  @override
  Widget build(BuildContext context) {
    // final videoPlayerController = videoController.videoPlayerController.value;

    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (videoController.videoPlayerController.value != null) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(videoController.videoPlayerController.value!),
                  videoController.isLoadingFilter.value
                      ? CircularProgressIndicator()
                      : SizedBox()
                ],
              );
            } else {
              return Text('No video loaded');
            }
          },
        ),
      ),
    );
  }
}
