import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/new_post/new_post_common_controller.dart';

class FlicksUploadingScreen extends StatelessWidget {
  const FlicksUploadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewPostController controller = Get.find();
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.isUploading.value
            ? "Uploading"
            : controller.isPosting.value
                ? "Posting"
                : "Completed")),
      ),
    );
  }
}
