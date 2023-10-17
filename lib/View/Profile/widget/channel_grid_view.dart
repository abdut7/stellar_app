import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/services/api_services/channel_service.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

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
    controller.pageNumber = 0;
    controller.loadMore(id: widget.id);
    return Obx(() => controller.channelItem.isNotEmpty
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
                      // Get.to(() => FlicksPlayerProfile(
                      //       id: widget.id,
                      //       pageNo: index,
                      //     ));
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
                                      .thumbnailUrl!))),
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
        : LinearProgressIndicator());
  }
}
