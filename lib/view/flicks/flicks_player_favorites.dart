import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/view/flicks/widget/flick_item_widget.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';

class FlicksPlayerFavorite extends StatelessWidget {
  final List<FlickItem> channelItemList;
  final int pageNo;
  FlicksPlayerFavorite({
    super.key,
    this.pageNo = 0,
    required this.channelItemList,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: pageNo);
    return Scaffold(
      body: channelItemList.isEmpty
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
              onPageChanged: (value) {},
              itemCount: channelItemList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return FlickItemWidget(flickItem: channelItemList[index]);
              },
            ),
    );
  }
}
