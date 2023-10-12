import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/flicks/widget/flick_item_widget.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';

class FlicksPlayerHomeScreen extends StatelessWidget {
  final bool isFromProfile;
  FlicksPlayerHomeScreen({super.key, this.isFromProfile = false});

  @override
  Widget build(BuildContext context) {
    FlicksPlayerController flicksController = Get.put(FlicksPlayerController());
    flicksController.loadMore();
    return Obx(
      () => Scaffold(
        body: flicksController.flickItems.isEmpty
            ? Container(
                height: Get.height,
                width: Get.width,
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : PageView.builder(
                onPageChanged: (value) {
                  if (value == flicksController.flickItems.length - 2) {
                    flicksController.loadMore();
                  }
                },
                itemCount: flicksController.flickItems.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return FlickItemWidget(
                      flickItem: flicksController.flickItems[index]);
                },
              ),
      ),
    );
  }
}
