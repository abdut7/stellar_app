// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';

// class VideoController extends GetxController {
//   // Define an RxString to store the video file path.
//   final RxString videoPath = "".obs;

//   // Define an Rx<VideoPlayerController> to store the video player controller.
//   final Rx<VideoPlayerController?> videoPlayerController = Rx<VideoPlayerController?>(null);

//   @override
//   void onInit() {
//     super.onInit();
//     ever(videoPath, (_) {
//       _initializeVideoPlayer();
//     });
//   }

//   // Method to set the video file path.
//   void setVideoPath(String path) {
//     videoPath.value = path;
//   }

//   // Method to initialize the video player controller.
//   void _initializeVideoPlayer() {
//     final controller = VideoPlayerController.file(File(videoPath.value));
//     videoPlayerController.value = controller;
//     controller.initialize().then((_) {
//       update();
//     });
//   }

//   @override
//   void onClose() {
//     videoPlayerController.value?.dispose();
//     super.onClose();
//   }
// }
