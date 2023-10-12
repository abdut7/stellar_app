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
                  crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
              itemCount: controller.flickItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(FlicksPlayerProfile(
                        id: widget.id,
                        pageNo: index,
                      ));
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: SColors.color9.withOpacity(0.4),
                      ),
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
