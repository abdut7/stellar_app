import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/profile/widget/profile_status.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';

import '../../../../models/api_models/user_details_model.dart';

// ignore: must_be_immutable
class FollowDetailsWidget extends StatefulWidget {
  final String uid;
  final UserDetailsModel model;

  FollowDetailsWidget({
    super.key,
    required this.uid,
    required this.model,
  });

  @override
  State<FollowDetailsWidget> createState() => _FollowDetailsWidgetState();
  late int following = 0;
  late bool isFollowing = false;
  late int followers = 0;
}

class _FollowDetailsWidgetState extends State<FollowDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    widget.following = widget.model.followingCount;
    widget.isFollowing = widget.model.isFollowing;
    widget.followers = widget.model.followersCount;
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileStatus(
                  count: "${widget.model.intPostCount}", label: 'Posts'),
              ProfileStatus(count: "${widget.following}", label: 'Following'),
              ProfileStatus(count: "${widget.followers}", label: 'Followers'),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                if (widget.isFollowing) {
                  AccountServices.unFollowUser(widget.uid).then((value) {
                    print(value);
                    if (value) {
                      setState(() {
                        widget.isFollowing = false;
                        widget.followers -= 1;
                      });
                    }
                  });
                } else {
                  AccountServices.followUser(widget.uid).then((value) {
                    if (value) {
                      setState(() {
                        widget.isFollowing = true;
                        widget.followers += 1;
                      });
                    }
                  });
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.74,
                height: 35,
                decoration: BoxDecoration(
                  color: widget.isFollowing
                      ? themeController.isDarkTheme.value
                          ? SColors.color3
                          : SColors.color11
                      : themeController.isDarkTheme.value
                          ? SColors.color27
                          : SColors.color12,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    widget.isFollowing ? "Following" : 'Follow',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: !widget.isFollowing
                          ? themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color11
                          : themeController.isDarkTheme.value
                              ? SColors.color26
                              : SColors.color12,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  SSvgs.forwardIcon,
                  color: themeController.isDarkTheme.value
                      ? SColors.color27
                      : SColors.color3,
                ))
          ],
        )
      ],
    );
  }
}
