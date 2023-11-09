import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String flickId;

  VideoPlayerScreen({required this.videoUrl, required this.flickId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool functionCalled = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          // Ensure the first frame is shown and play the video.
          _controller.play();
          _controller.setLooping(true);
        });
      });
    _controller.addListener(() {
      final position = _controller.value.position;

      // Check if the video has been playing for at least 10 seconds
      if (position >= Duration(seconds: 10) && !functionCalled) {
        // Call your function here
        FliqServices.addView(flickId: widget.flickId);

        // Set the flag to prevent calling the function multiple times
        functionCalled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.black,
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(), // Display a loading indicator until the video is loaded.
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
