import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/flicks/widget/flick_item_widget.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class FlicksPlayerHomeScreen extends StatefulWidget {
  final bool isFromChannel;
  final int page;

  FlicksPlayerHomeScreen(
      {super.key, this.isFromChannel = false, this.page = 0});

  @override
  State<FlicksPlayerHomeScreen> createState() => _FlicksPlayerHomeScreenState();
}

class _FlicksPlayerHomeScreenState extends State<FlicksPlayerHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ThemeController>().isInsideDarkScreens(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    FlicksPlayerController flicksController = Get.put(FlicksPlayerController());
    if (!widget.isFromChannel) {
      flicksController.loadMore();
    }
    PageController pageController = PageController(initialPage: widget.page);
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
