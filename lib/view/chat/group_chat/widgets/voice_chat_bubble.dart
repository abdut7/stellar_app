import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stellar_chat/controllers/audio_player_controller.dart';

class AudioMessageBubble extends StatefulWidget {
  final String audioUrl;
  final bool isSender;
  final String createdTime;
  final AudioController audioController;
  final bool isAudio;

  const AudioMessageBubble(
      {super.key,
      required this.audioUrl,
      required this.isSender,
      required this.createdTime,
      required this.audioController,
      this.isAudio = false});

  @override
  _AudioMessageBubbleState createState() => _AudioMessageBubbleState();
}

class _AudioMessageBubbleState extends State<AudioMessageBubble> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    AudioController().stopAudio();
    super.dispose();
  }

  Duration duration = Duration.zero;
  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(0),
      bottomRight: Radius.circular(0),
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    );

    return Align(
      alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        children: [
          Container(
            width: Get.width * 0.6,
            margin: const EdgeInsets.only(
              top: 4.0,
            ),
            decoration: BoxDecoration(
              color: widget.isSender
                  ? const Color.fromRGBO(233, 244, 255, 1)
                  : const Color.fromRGBO(244, 244, 244, 1),
              borderRadius: borderRadius,
            ),
            child: Column(
              crossAxisAlignment: widget.isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Obx(
                  () {
                    // final audioState =
                    //     widget.audioController.audioPlayerState.value;
                    final audioPosition =
                        widget.audioController.audioPlayerPosition.value;
                    final totalDuration =
                        widget.audioController.audioTotalDuration.value;
                    bool isPlaying =
                        widget.audioController.currentlyPlayingAudioUrl ==
                                widget.audioUrl.trim() &&
                            widget.audioController.isPlaying.value;

                    return SizedBox(
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 8, top: 8, bottom: 8),
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(0, 51, 142, 1),
                              child: Icon(
                                Icons.headphones,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              if (widget.audioController
                                      .currentlyPlayingAudioUrl ==
                                  widget.audioUrl.trim()) {
                                Logger().d("On pressed");
                                Logger()
                                    .d(widget.audioController.audioPlayerState);
                                // This audio is already playing, pause it
                                if (widget.audioController.audioPlayerState
                                        .value ==
                                    PlayerState.paused) {
                                  Logger()
                                      .d("The state was paused now resuming");
                                  widget.audioController
                                      .playAudio(widget.audioUrl);
                                } else if (widget.audioController
                                        .audioPlayerState.value ==
                                    PlayerState.playing) {
                                  Logger()
                                      .d("The state was Playing now Pausing");
                                  widget.audioController.pauseAudio();
                                }
                              } else {
                                Logger()
                                    .d("The state was Not playing now playing");
                                // Play this audio
                                widget.audioController
                                    .audioPlayerState(PlayerState.playing);
                                widget.audioController
                                    .playAudio(widget.audioUrl);
                              }
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 16, top: 16),
                              child: ProgressBar(
                                barHeight: 3,
                                thumbRadius: 7,
                                progressBarColor:
                                    const Color.fromRGBO(0, 51, 142, 1),
                                baseBarColor:
                                    const Color.fromRGBO(156, 156, 156, 1),
                                thumbColor: const Color.fromRGBO(0, 51, 142, 1),
                                progress:
                                    isPlaying ? audioPosition : Duration.zero,
                                total: totalDuration,
                                onSeek: (duration) {
                                  widget.audioController.seekAudio(duration);
                                },
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 8,
                          // ),
                        ],
                      ),
                    );
                  },
                ),
                // Text(
                //   '${completedDuration.inMinutes}:${(completedDuration.inSeconds % 60).toString().padLeft(2, '0')} / ${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                //   style: const TextStyle(color: Colors.black),
                // ),
                // Text(
                //   widget.createdTime,
                //   style: const TextStyle(color: Colors.grey, fontSize: 8),
                // ),
              ],
            ),
          ),
          Container(
            height: 15,
            width: Get.width * 0.6,
            decoration: BoxDecoration(
              color: widget.isSender
                  ? const Color.fromRGBO(197, 229, 255, 1)
                  : const Color.fromRGBO(224, 224, 224, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: widget.isSender
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                bottomRight: !widget.isSender
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
              ),
            ),
            child: Row(
              mainAxisAlignment: widget.isSender
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 2.0, right: 5, left: 5),
                  child: Text(
                    widget.createdTime,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                widget.isSender
                    ? SvgPicture.string(
                        """<svg width="10" height="5" viewBox="0 0 10 5" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 2.38197C0.0398437 2.30405 0.0679687 2.21808 0.121875 2.15236C0.317708 1.91496 0.652083 1.91185 0.877083 2.14275C1.37378 2.65358 1.86901 3.16492 2.36276 3.67678L2.48802 3.80665C2.7263 3.55912 2.95521 3.31133 3.19479 3.07392C4.17257 2.10613 5.15122 1.1399 6.13073 0.175222C6.2888 0.0193778 6.46927 -0.0416612 6.68203 0.0295076C7.03568 0.148209 7.12891 0.589508 6.85703 0.863014C6.53854 1.18353 6.21406 1.49834 5.89349 1.81548C4.8796 2.81548 3.86615 3.81574 2.85312 4.81626C2.69687 4.97211 2.51667 5.04016 2.30443 4.96873C2.22209 4.93891 2.1477 4.89066 2.08698 4.82769C1.43924 4.16483 0.794792 3.49929 0.153646 2.83107C0.0869792 2.7612 0.0494792 2.66275 0 2.57756V2.38197Z" fill="#00338E"/>
<path d="M10.0001 0.608279C9.96049 0.754513 9.867 0.862565 9.76101 0.96672C8.46205 2.24516 7.16379 3.52447 5.86622 4.80464C5.59903 5.06984 5.31596 5.06438 5.05215 4.7888C4.91726 4.64802 4.78106 4.5088 4.64695 4.36724C4.43393 4.1423 4.42976 3.83503 4.63549 3.63685C4.84122 3.43867 5.14721 3.4501 5.36622 3.67166L5.50684 3.81477C5.88314 3.42516 6.24903 3.03243 6.62846 2.65399C7.45241 1.83295 8.28861 1.02412 9.1084 0.198928C9.4209 -0.115617 9.9032 0.0308762 9.98575 0.40672C9.98911 0.415977 9.99376 0.42472 9.99955 0.432694L10.0001 0.608279Z" fill="#00338E"/>
</svg>
""")
                    : const SizedBox(),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // void stopAudio() {
  //   if (audioPlayerState == PlayerState.playing) {
  //     audioPlayer.stop();
  //   }
  // }
}
