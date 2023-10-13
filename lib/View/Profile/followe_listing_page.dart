import 'package:flutter/material.dart';
import 'package:stellar_chat/services/api_services/following_services.dart';

enum FollowingOrFollower { following, followers }

class FollowerListingPage extends StatelessWidget {
  final FollowingOrFollower page;
  const FollowerListingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: page == FollowingOrFollower.following
            ? FollowingServices().getFollowingList()
            : FollowingServices().getFollowerList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Text("hello");
        },
      ),
    );
  }
}
