// import 'package:just_audio/just_audio.dart';

// class AudioPlayerManager {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   // Private constructor
//   AudioPlayerManager._();

//   // Singleton instance
//   static final AudioPlayerManager _instance = AudioPlayerManager._();

//   factory AudioPlayerManager() {
//     return _instance;
//   }

//   Future<void> playAudio(String audioUrl) async {
//     // Stop any currently playing audio
//     await _audioPlayer.stop();
//     await _audioPlayer.setUrl(audioUrl);
//     await _audioPlayer.play();
//   }

//   Future<void> pauseAudio() async {
//     await _audioPlayer.pause();
//   }

//   Future<void> resumeAudio() async {
//     await _audioPlayer.play();
//   }

//   Future<void> stopAudio() async {
//     await _audioPlayer.stop();
//   }
// }
