import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/flicks/flicks_player_favorites.dart';
import 'package:stellar_chat/View/flicks/flicks_player_profile.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

import '../controllers/flicks/flicks_player_controller.dart';

class FavoriteFlicksGridView extends StatefulWidget {
  FavoriteFlicksGridView();

  @override
  _FavoriteGridVFlicksGridView createState() => _FavoriteGridVFlicksGridView();
}

class _FavoriteGridVFlicksGridView extends State<FavoriteFlicksGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FliqServices().getFavoriteFlicks(),
        builder: (context, AsyncSnapshot<List<FlickItem>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return LinearProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FlicksPlayerFavorite(
                            channelItemList: snapshot.data!,
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
                              image: NetworkImage(snapshot.data!
                                          .elementAt(index)
                                          .strThumbnailUrl ==
                                      null
                                  ? """https://loremflickr.com/cache/resized/65535_53065639115_14eaf016a0_z_640_360_nofilter.jpg"""
                                  : snapshot.data!
                                      .elementAt(index)
                                      .strThumbnailUrl!))),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
