// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:stellar_chat/View/video_editor/video_filter/filters/black_and_white.dart';
// import 'package:stellar_chat/controllers/filter_controller.dart';
// import 'package:video_player/video_player.dart';

// class VideoFilterHomeScreen extends StatefulWidget {
//   final String videoPath;
//   const VideoFilterHomeScreen({super.key, required this.videoPath});

//   @override
//   State<VideoFilterHomeScreen> createState() => _VideoFilterHomeScreenState();
// }

// class _VideoFilterHomeScreenState extends State<VideoFilterHomeScreen> {
//   // final VideoController videoController = Get.put(VideoController());
//   late VideoPlayerController videoPlayerController;
//   @override
//   void initState() {
//     super.initState();
//     // videoController.setVideoPath(widget.videoPath);
//   }

//   bool isApplyingFilter = false;

//   Future<void> applyFilter() async {
//     print("started applying");
//     String? recievedPath =
//         await applyBlackAndWhiteFilterUsingFFmpeg(widget.videoPath);
//     if (recievedPath != null) {
//       print("New value recieved");
//       // videoController.setVideoPath(recievedPath);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(120), // Set this height
//         child: Container(
//             height: 80,
//             color: const Color.fromRGBO(159, 196, 232, 1),
//             child: SafeArea(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: SvgPicture.string(
//                         """<svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
//                                     <path d="M7.5 14L1 7.5L7.5 1" stroke="black" stroke-width="2" stroke-linejoin="round"/>
//                                     </svg>
//                                     """),
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: () async {
//                       applyFilter();
//                     },
//                     child: Row(
//                       children: [
//                         const Text(
//                           "Next",
//                           style:
//                               TextStyle(color: Color.fromRGBO(0, 51, 142, 1)),
//                         ),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         SvgPicture.string(
//                             """<svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
//                     <path d="M1 1L7.5 7.5L1 14" stroke="black" stroke-width="2" stroke-linejoin="round"/>
//                     </svg>
//                     """),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ),
//       body: Column(
//         children: [
//           Container(
//               height: Get.height * 0.7,
//               width: Get.width,
//               decoration: const BoxDecoration(color: Colors.red),
//               child: Obx(() {
//                 print("rebuilding");
//                 return VideoPlayerWidget();
//               })),
//           const SizedBox(
//             height: 15,
//           ),
//           SizedBox(
//             height: Get.height * 0.15,
//             child: ListView.separated(
//               separatorBuilder: (context, index) => const SizedBox(
//                 width: 1,
//               ),
//               scrollDirection: Axis.horizontal,
//               itemCount: 10,
//               itemBuilder: (context, index) => Column(
//                 children: [
//                   const Text(
//                     "Normal",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Container(
//                     height: Get.height * 0.12,
//                     width: Get.height * 0.12,
//                     decoration: BoxDecoration(
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class VideoPlayerWidget extends StatelessWidget {
//   final VideoController videoController = Get.put(VideoController());

//   @override
//   Widget build(BuildContext context) {
//     final videoPlayerController = videoController.videoPlayerController.value;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player Example'),
//       ),
//       body: Center(
//         child: Obx(
//           () {
//             if (videoPlayerController != null) {
//               return AspectRatio(
//                 aspectRatio: videoPlayerController.value.aspectRatio,
//                 child: VideoPlayer(videoPlayerController),
//               );
//             } else {
//               return Text('No video loaded');
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Change the video file path in the controller.
//           videoController.setVideoPath("your_new_video.mp4");
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }
