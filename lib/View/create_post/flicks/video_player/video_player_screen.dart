import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/create_post/channel/upload_new_post.dart';
import 'package:stellar_chat/View/create_post/flicks/flicks_upload_new_post/upload_new_post.dart';
import 'package:stellar_chat/View/create_post/flicks/tag_people_screen/tag_people_screen.dart';
import 'package:stellar_chat/utils/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoFilePath;
  final bool isFromChannel;

  VideoPlayerScreen({required this.videoFilePath, required this.isFromChannel});

  @override
  _VideoPlayerScreen createState() => _VideoPlayerScreen();
}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.videoFilePath))
      ..initialize().then((_) {});
    _controller.addListener(() {
      if (_controller.value.duration == _controller.value.position) {
        isPlaying = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.08,
                ),
                //close button
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.string(
                        """<svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M12.9995 1.00098L1.00015 13.0003" stroke="black" stroke-width="2" stroke-linecap="round"/>
                          <path d="M12.9995 12.999L1.00015 0.999657" stroke="black" stroke-width="2" stroke-linecap="round"/>
                          </svg>
                          """),
                  ),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: IconButton(
                          onPressed: () {
                            isPlaying = !isPlaying;
                            if (isPlaying) {
                              _controller.play();
                              isPlaying = true;
                            } else {
                              _controller.pause();
                            }
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    Expanded(
                      child: ProgressBar(
                        onSeek: (value) {
                          _controller.seekTo(value);
                        },
                        progress: _controller.value.position,
                        total: _controller.value.duration,
                        timeLabelTextStyle:
                            const TextStyle(color: Colors.white),
                        timeLabelLocation: TimeLabelLocation.below,
                        thumbColor: const Color.fromRGBO(159, 196, 232, 1),
                        progressBarColor:
                            const Color.fromRGBO(159, 196, 232, 1),
                        baseBarColor: const Color.fromRGBO(234, 234, 234, 1),
                        barHeight: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.isFromChannel) {
                          Get.to(
                            () => ChannelUploadNewPost(
                              path: widget.videoFilePath,
                            ),
                          );
                          return;
                        }
                        Get.to(
                          () => FlicksUploadNewPost(
                            path: widget.videoFilePath,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SvgPicture.string(
                            """<svg width="24" height="26" viewBox="0 0 24 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M23.9347 12.9999C23.9347 13.8516 23.3852 14.6099 22.4297 15.0883L3.273 24.6666C2.80633 24.8999 2.35133 25.0166 1.93133 25.0166C1.3235 25.0166 0.787997 24.7599 0.448497 24.3061C0.157997 23.9083 -0.122003 23.2199 0.216331 22.0999L2.37466 14.9016C2.44466 14.6916 2.49133 14.4361 2.51466 14.1666H14.333C14.9747 14.1666 15.4997 13.6416 15.4997 12.9999C15.4997 12.3583 14.9747 11.8333 14.333 11.8333H2.51466C2.49016 11.5649 2.4435 11.3083 2.37466 11.0983L0.216331 3.89994C-0.122003 2.77994 0.157997 2.09161 0.449664 1.69494C1.02133 0.924945 2.10633 0.749945 3.273 1.33328L22.4308 10.9116C23.3863 11.3899 23.9347 12.1483 23.9347 12.9999Z" fill="white"/>
                      </svg>
                      """),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
