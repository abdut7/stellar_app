import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/channel/channel_view/widgets/video_card_channel_view.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';

class ChannelGridView extends StatefulWidget {
  final IconData? icon;
  final String id;

  ChannelGridView({this.icon, required this.id});

  @override
  _ChannelGridViewState createState() => _ChannelGridViewState();
}

class _ChannelGridViewState extends State<ChannelGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfileChannelController controller = Get.put(ProfileChannelController());
    ChannelHomeController channelHomeController =
        Get.put(ChannelHomeController());
    controller.pageNumber = 0;
    controller.loadMore(id: widget.id);
    return Obx(() {
      if (controller.channelItem.isNotEmpty) {
        channelHomeController.channelItems(controller.channelItem);
      }
      return controller.channelItem.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: controller.channelItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => VideoCardChannelView(
                              channelItem:
                                  controller.channelItem.elementAt(index),
                            ));
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: SColors.color9.withOpacity(0.4),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(controller.channelItem
                                            .elementAt(index)
                                            .thumbnailUrl ==
                                        null
                                    ? """https://loremflickr.com/cache/resized/65535_53065639115_14eaf016a0_z_640_360_nofilter.jpg"""
                                    : controller.channelItem
                                        .elementAt(index)
                                        .thumbnailUrl!
                                        .trim()))),
                        child: widget.icon != null
                            ? Icon(
                                widget.icon,
                                color: Colors.grey.withOpacity(0.7),
                                size: 40,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            )
          : LinearProgressIndicator();
    });
  }
}
