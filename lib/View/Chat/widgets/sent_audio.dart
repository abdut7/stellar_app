import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

/// this widget is used to render voice note container
/// with ist full functionality

class AudioMessageWidget extends StatefulWidget {
  final bool isSender;
  final String url;
  final Color senderColor;
  final Color inActiveAudioSliderColor;
  final Color activeAudioSliderColor;

  AudioMessageWidget(
      {Key? key,
      required this.senderColor,
      required this.inActiveAudioSliderColor,
      required this.activeAudioSliderColor,
      required this.url, required this.isSender})
      : super(key: key);

  @override
  _AudioMessageWidgetState createState() => _AudioMessageWidgetState();
}

class _AudioMessageWidgetState extends State<AudioMessageWidget> {
  final player = AudioPlayer();
  Duration? duration = Duration.zero;
  Duration seekBarPosition = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() async {
    Uri.parse(widget.url).isAbsolute
        ? duration = await player.setUrl(widget.url)
        : duration = await player.setFilePath(widget.url);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.isSender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.75,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.senderColor)
                .withOpacity(widget.isSender ? 1 : 0.1),
          ),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  isPlaying ? player.pause() : play();
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: widget.isSender
                      ? Colors.white
                      : (widget.senderColor),
                  // size: 25,
                ),
              ),
              Expanded(
                child: Slider(
                    activeColor: widget.activeAudioSliderColor,
                    inactiveColor: widget.inActiveAudioSliderColor,
                    max: player.duration?.inMilliseconds.toDouble() ?? 1,
                    value: player.position.inMilliseconds.toDouble(),
                    onChanged: (d) {
                      setState(() {
                        player.seek(Duration(milliseconds: d.toInt()));
                      });
                    }),
              ),
              Text(
                _printDuration(player.position),
                style: TextStyle(
                    fontSize: 12,
                    color: widget.isSender ? Colors.white : null),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// this function is used to play audio wither its from url or path file
  void play() {
    if (player.duration != null && player.position >= player.duration!) {
      player.seek(Duration.zero);
      setState(() {
        isPlaying = false;
      });
    }
    print(player.duration);
    print(player.position);
    player.play();

    player.positionStream.listen((duration) {
      // duration == player.duration;
      setState(() {
        seekBarPosition = duration;
      });
      if (player.duration != null && player.position >= player.duration!) {
        player.stop();
        player.seek(Duration.zero);
        setState(() {
          isPlaying = false;
          seekBarPosition = Duration.zero;
        });
      }
    });
  }

  /// function used to print the duration of the current audio duration
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String hoursString =
        duration.inHours == 0 ? '' : "${twoDigits(duration.inHours)}:";
    return "$hoursString$twoDigitMinutes:$twoDigitSeconds";
  }
}
