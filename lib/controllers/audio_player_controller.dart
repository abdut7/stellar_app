import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  String? currentlyPlayingAudioUrl;
  Rx<PlayerState> audioPlayerState = PlayerState.stopped.obs;
  Rx<Duration> audioPlayerPosition = Duration.zero.obs;
  RxBool isPlaying = RxBool(false);
  Rx<Duration> audioTotalDuration = Duration.zero.obs;

  Future<void> playAudio(String audioUrl) async {
    if (currentlyPlayingAudioUrl == audioUrl) {
      // The same audio is already playing, do nothing
      return;
    }
    isPlaying(false);

    // Stop the currently playing audio (if any)
    await stopAudio();

    // Play the new audio
    await audioPlayer.play(UrlSource(audioUrl));

    currentlyPlayingAudioUrl = audioUrl;
    isPlaying(true);

    // Update audio state and notify listeners
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      audioPlayerState.value = state;
      update();
    });
    audioPlayer.onPositionChanged.listen((Duration duration) {
      audioPlayerPosition.value = duration;
      update();
    });

    // Update audio position and notify listeners

    // Get and update the total duration of the audio
    final totalDuration = await audioPlayer.getDuration();
    audioTotalDuration.value = totalDuration!;
    update();
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    currentlyPlayingAudioUrl = null;
    audioPlayerState.value = PlayerState.stopped;
    audioPlayerPosition.value = Duration.zero;
    audioTotalDuration.value = Duration.zero;
    isPlaying(false);
    update();
  }

  Future<void> seekAudio(Duration position) async {
    await audioPlayer.seek(position);
  }

  // audioPlayer.onPositionChanged.listen((Duration duration) {
  //   setState(() {
  //     completedDuration = duration;
  //   });
  // });
}
