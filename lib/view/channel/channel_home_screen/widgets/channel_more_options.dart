import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
import 'package:stellar_chat/view/profile/public_profile/public_profile.dart';

Set<String> favoriteChannelList = {};

class ChannelBottomSheet extends StatefulWidget {
  final ChannelItem channelItem;

  ChannelBottomSheet({required this.channelItem});

  @override
  State<ChannelBottomSheet> createState() => _ChannelBottomSheetState();
}

bool isFavorite = false;

class _ChannelBottomSheetState extends State<ChannelBottomSheet> {
  @override
  void initState() {
    if (favoriteChannelList.contains(widget.channelItem.id)) {
      isFavorite = true;
      favoriteChannelList.add(widget.channelItem.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Container(
          width: Get.width * 0.6,
          height: 3.0, // Adjust the height of the line as needed
          color: const Color.fromRGBO(0, 51, 142, 0.5),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  if (isFavorite) {
                    //call unfavorite api
                    //remove item from list
                    isFavorite = false;
                    favoriteChannelList.remove(widget.channelItem.id);
                  } else {
                    //call favorite api
                    //append if to list
                    isFavorite = false;
                    favoriteChannelList.add(widget.channelItem.id);
                  }
                  setState(() {});
                },
                child: Text(
                  isFavorite ? "Remove from Favorites" : 'Save to Favorites',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 51, 142, 1),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Handle tapping 'Share'
                  Get.back();
                },
                child: const Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 51, 142, 1),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const SizedBox(
                height: 20,
              ),
              userController.userDetailsModel.value!.id ==
                      widget.channelItem.userId
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Get.back();
                        // Handle tapping 'View Profile'
                        Get.to(() => PublicProfileScreen(
                            uid: widget.channelItem.userId));
                        print('Tapped View Profile');
                      },
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(0, 51, 142, 1),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
