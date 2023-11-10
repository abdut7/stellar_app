import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:logger/logger.dart';
import 'package:stellar_chat/services/get_cached_file_path.dart';

class AudioController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  String? currentlyPlayingAudioUrl;
  Rx<PlayerState> audioPlayerState = PlayerState.stopped.obs;
  Rx<Duration> audioPlayerPosition = Duration.zero.obs;
  RxBool isPlaying = RxBool(false);
  Rx<Duration> audioTotalDuration = Duration.zero.obs;

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    audioPlayerState.value = PlayerState.paused;
    currentlyPlayingAudioUrl = null;
    // audioPlayerState.value = PlayerState.stopped;
    audioPlayerPosition.value = Duration.zero;
    audioTotalDuration.value = Duration.zero;
    isPlaying(false);
    update();
  }

  Future<void> resumeAudio() async {
    await audioPlayer.resume();
    audioPlayerState.value = PlayerState.playing;
    isPlaying(false);
    update();
  }

  Future<void> completedPalayback() async {
    audioPlayerState.value = PlayerState.completed;
    currentlyPlayingAudioUrl = null;
    // audioPlayerState.value = PlayerState.stopped;
    audioPlayerPosition.value = Duration.zero;
    audioTotalDuration.value = Duration.zero;
    isPlaying(false);
    update();
  }

  Future<void> playAudio(String audioUrl) async {
    // Update audio state and notify listeners
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        completedPalayback();
      }
      audioPlayerState.value = state;
      Logger().e(audioPlayerState.value);
      update();
    });
    audioPlayer.onPositionChanged.listen((Duration duration) {
      audioPlayerPosition.value = duration;
      update();
    });
    audioPlayerState.value = PlayerState.playing;

    audioUrl = audioUrl.trim();
    if (currentlyPlayingAudioUrl == audioUrl) {
      // The same audio is already playing, do nothing
      return;
    }
    isPlaying(false);

    // Stop the currently playing audio (if any)
    await stopAudio();
    String? path = await getCachedFilePath(audioUrl);
    print("path is $path");
    // Play the new audio

    await audioPlayer.play(DeviceFileSource(path!));

    currentlyPlayingAudioUrl = audioUrl;
    isPlaying(true);

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
