import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/flicks/flicks_player_profile.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';

class FlickGridView extends StatefulWidget {
  final IconData? icon;
  final String id;

  FlickGridView({this.icon, required this.id});

  @override
  _FlickGridViewState createState() => _FlickGridViewState();
}

class _FlickGridViewState extends State<FlickGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfileFlicksController controller = Get.put(ProfileFlicksController());
    controller.pageNumber = 0;
    controller.loadMore(id: widget.id);
    return Obx(() => controller.flickItems.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: controller.flickItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FlicksPlayerProfile(
                            id: widget.id,
                            pageNo: index,
                          ));
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: SColors.color9.withOpacity(0.4),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(controller.flickItems
                                          .elementAt(index)
                                          .strThumbnailUrl ==
                                      null
                                  ? """https://loremflickr.com/cache/resized/65535_53065639115_14eaf016a0_z_640_360_nofilter.jpg"""
                                  : controller.flickItems
                                      .elementAt(index)
                                      .strThumbnailUrl!
                                      .trim()))),
                    ),
                  ),
                );
              },
            ),
          )
        : LinearProgressIndicator());
  }
}
