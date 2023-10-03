import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioMessageBubble extends StatefulWidget {
  final String audioUrl;
  final bool isSender;
  final String createdTime;

  AudioMessageBubble(
      {required this.audioUrl,
      required this.isSender,
      required this.createdTime});

  @override
  _AudioMessageBubbleState createState() => _AudioMessageBubbleState();
}

class _AudioMessageBubbleState extends State<AudioMessageBubble> {
  late AudioPlayer audioPlayer;
  PlayerState audioPlayerState = PlayerState.stopped;
  Duration totalDuration = const Duration();
  Duration completedDuration = const Duration();
  double sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        totalDuration = duration;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration duration) {
      setState(() {
        completedDuration = duration;
        if (totalDuration.inMilliseconds > 0) {
          sliderValue =
              completedDuration.inMilliseconds / totalDuration.inMilliseconds;
        } else {
          sliderValue = 0.0;
        }
      });
    });
    @override
    void dispose() {
      audioPlayer.stop();
      audioPlayer.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(0),
      bottomRight: Radius.circular(0),
      topLeft: const Radius.circular(16.0),
      topRight: const Radius.circular(16.0),
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
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
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
                          audioPlayerState == PlayerState.playing
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (audioPlayerState == PlayerState.playing) {
                            audioPlayer.pause();
                          } else {
                            audioPlayer.play(UrlSource(widget.audioUrl));
                          }
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            // Handle swipe gestures for fast-forwarding
                            final double screenWidth =
                                MediaQuery.of(context).size.width;
                            final double dragDistance =
                                details.primaryDelta ?? 0.0;

                            setState(() {
                              final double newSliderValue =
                                  (sliderValue + (dragDistance / screenWidth))
                                      .clamp(0.0, 1.0);
                              sliderValue = newSliderValue;
                              final double newPosition =
                                  newSliderValue * totalDuration.inMilliseconds;
                              audioPlayer.seek(
                                  Duration(milliseconds: newPosition.round()));
                            });
                          },
                          child: LinearProgressIndicator(
                            value: sliderValue,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(0, 51, 142, 1)),
                            backgroundColor: Colors.grey[400],
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 8,
                      // ),
                    ],
                  ),
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
                color: Color.fromRGBO(197, 229, 255, 1),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0, right: 5),
                  child: Text(
                    widget.createdTime,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
