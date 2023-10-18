import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/models/api_models/follow_model.dart';
import 'package:stellar_chat/services/api_services/following_services.dart';
import 'package:stellar_chat/utils/colors.dart';

enum FollowingOrFollower { following, followers }

class FollowerListingPage extends StatelessWidget {
  final FollowingOrFollower page;
  const FollowerListingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: AppBar(
        backgroundColor: themeController.isDarkTheme.value
            ?  SColors.appbarbgInDark
            : SColors.color12,
        title: Text(
            page == FollowingOrFollower.following ? "Following" : "Followers",
          style:TextStyle(
            color: themeController.isDarkTheme.value ?  SColors.appbarTitleInDark : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: page == FollowingOrFollower.following
            ? FollowingServices().getFollowingList()
            : FollowingServices().getFollowerList(),
        builder: (BuildContext context, AsyncSnapshot<FollowModel?> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.followList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      snapshot.data!.followList[index].profileIcon),
                ),
                onTap: () {
                  Get.to(
                    () => PublicProfileScreen(
                        uid: snapshot.data!.followList[index].userId),
                  );
                },
                title: Text(snapshot.data!.followList[index].fullName,
                  style: TextStyle(
                    color: themeController.isDarkTheme.value ?  SColors.color4 : SColors.color3,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),),
              );
            },
          );
        },
      ),
    );
  }
}
