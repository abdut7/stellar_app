import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/profile/public_profile/public_profile.dart';
import 'package:stellar_chat/models/api_models/follow_model.dart';
import 'package:stellar_chat/services/api_services/following_services.dart';
import 'package:stellar_chat/utils/colors.dart';

enum FollowingOrFollower { following, followers }

class FollowerListingPage extends StatelessWidget {
  final FollowingOrFollower page;
  const FollowerListingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
            page == FollowingOrFollower.following ? "Following" : "Followers"),
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
                title: Text(snapshot.data!.followList[index].fullName),
              );
            },
          );
        },
      ),
    );
  }
}
