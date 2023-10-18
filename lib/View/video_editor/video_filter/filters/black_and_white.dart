import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

Future<String?> applyBlackAndWhiteFilterUsingFFmpeg(
    String videoFilePath) async {
  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';
  // Create a new video file to store the filtered video.

  String commandToExecute =
      "-i $videoFilePath -vf hue=s=0 -c:v mpeg4 $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Filter applied successfully");
      return newVideoFilePath;
      // You can continue with additional processing or display the filtered video.
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  return newVideoFilePath;

  // Create a new FFmpegCommand.
  // Return the new video file path.
}
