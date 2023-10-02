import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/profile/widget/profile_status.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
  late int following;
  late bool isFollowing;
}

class _FollowDetailsWidgetState extends State<FollowDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    widget.following = widget.model.followingCount;
    widget.isFollowing = widget.model.isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              ProfileStatus(
                  count: "${widget.model.intPostCount}", label: 'Posts'),
              ProfileStatus(count: "${widget.following}", label: 'Following'),
              ProfileStatus(
                  count: "${widget.model.followersCount}", label: 'Followers'),
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
                        widget.following -= 1;
                      });
                    }
                  });
                } else {
                  AccountServices.followUser(widget.uid).then((value) {
                    if (value) {
                      setState(() {
                        widget.isFollowing = true;
                        widget.following += 1;
                      });
                    }
                  });
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 51, 142, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    widget.isFollowing ? "Following" : 'Follow',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(159, 196, 232, 1)),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {}, child: SvgPicture.asset(SSvgs.forwardIcon))
          ],
        )
      ],
    );
  }
}
