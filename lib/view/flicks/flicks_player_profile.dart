import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/view/flicks/widget/flick_item_widget.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';

class FlicksPlayerProfile extends StatelessWidget {
  final String id;
  final int pageNo;
  FlicksPlayerProfile({
    super.key,
    required this.id,
    this.pageNo = 0,
  });

  @override
  Widget build(BuildContext context) {
    ProfileFlicksController flicksController = Get.find();
    PageController pageController = PageController(initialPage: pageNo);
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
                controller: pageController,
                onPageChanged: (value) {
                  if (value == flicksController.flickItems.length - 2) {
                    flicksController.loadMore(id: id);
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
