import 'dart:io';

import 'package:video_player/video_player.dart';

Future<String> getVideoDuration(String videoPath) async {
  final videoPlayerController = VideoPlayerController.file(File(videoPath));

  await videoPlayerController.initialize();

  final duration = videoPlayerController.value.duration;

  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  videoPlayerController.dispose();

  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
