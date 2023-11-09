import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:get/get.dart';

import '../../../../controllers/filter_controller.dart';

Future<void> applyNormalColor(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.setVideoPath(videoFilePath);
}

Future<void> applyBlackAndWhiteFilterUsingFFmpeg(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf hue=s=0 -c:v mpeg4 $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);

      // You can continue with additional processing or display the filtered video.
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  videoController.isLoadingFilter(false);
}

Future<void> applySepiaFilterUsingFFmpeg(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf colorchannelmixer=.393:.769:.189:0:.349:.686:.168:0:.272:.534:.131 $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Sepia filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  videoController.isLoadingFilter(false);
}

Future<void> applyGrayscaleFilterUsingFFmpeg(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf hue=s=0 -c:v mpeg4 $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Grayscale filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  videoController.isLoadingFilter(false);
}

Future<void> applyRedTintUsingFFmpeg(String videoFilePath) async {
  print("started");
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf 'colorbalance=rs=2.0:rm=1.0' -c:v mpeg4 $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Blue tint filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);
    } else if (ReturnCode.isCancel(returnCode)) {
      print("Cancel");
      // CANCEL
    } else {
      // ERROR
      print("erroro");
    }
  });
  videoController.isLoadingFilter(false);
}

Future<void> applyBlurFilterUsingFFmpeg(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf 'boxblur=5:1' $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Blur filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  videoController.isLoadingFilter(false);
}

Future<void> applyVintageFilterUsingFFmpeg(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf curves=vintage $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Vintage filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  videoController.isLoadingFilter(false);
}

Future<void> applyCartoonEffectFilterUsingFFmpeg(String videoFilePath) async {
  final VideoController videoController = Get.find();
  videoController.isLoadingFilter(true);

  final newVideoFilePath =
      '${Directory.systemTemp.path}/video-${DateTime.now().millisecondsSinceEpoch}.mp4';

  String commandToExecute =
      "-i $videoFilePath -vf 'format=gray,posterize=5,curves=all=\'0/0 0.5/0.5 1/1 1/1\'' $newVideoFilePath";

  await FFmpegKit.execute(commandToExecute).then((session) async {
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      print("Cartoon effect filter applied successfully");
      videoController.setVideoPath(newVideoFilePath);
    } else if (ReturnCode.isCancel(returnCode)) {
      // CANCEL
    } else {
      // ERROR
    }
  });
  videoController.isLoadingFilter(false);
}
