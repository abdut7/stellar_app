import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/channel/channel_view/widgets/video_card_channel_view.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
import 'package:stellar_chat/services/api_services/channel_service.dart';

class FavoriteChannelGridView extends StatefulWidget {
  FavoriteChannelGridView();

  @override
  _FavoriteChannelGridView createState() => _FavoriteChannelGridView();
}

class _FavoriteChannelGridView extends State<FavoriteChannelGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChannelHomeController channelHomeController =
        Get.put(ChannelHomeController());
    return FutureBuilder(
        future: ChannelService().getFavoriteChannel(),
        builder: (context, AsyncSnapshot<List<ChannelItem>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return LinearProgressIndicator();
          }
          channelHomeController.channelItems(snapshot.data);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => VideoCardChannelView(
                            channelItem: snapshot.data!.elementAt(index),
                          ));
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: SColors.color9.withOpacity(0.4),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(snapshot.data!
                                      .elementAt(index)
                                      .thumbnailUrl ==
                                  null
                              ? """https://loremflickr.com/cache/resized/65535_53065639115_14eaf016a0_z_640_360_nofilter.jpg"""
                              : snapshot.data!.elementAt(index).thumbnailUrl!),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
