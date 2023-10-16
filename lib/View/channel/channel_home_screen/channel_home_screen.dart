import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/flicks_suggestions.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';

class ChannelHomeScreen extends StatefulWidget {
  const ChannelHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChannelHomeScreen> createState() => _ChannelHomeScreenState();
}

class _ChannelHomeScreenState extends State<ChannelHomeScreen> {
  @override
  Widget build(BuildContext context) {
    ChannelHomeController channelHomeController =
        Get.put(ChannelHomeController());
    channelHomeController.fetchNextPage();
    UserController userController = Get.find();
    return Obx(() => Scaffold(
          backgroundColor: SColors.color4,
          body: channelHomeController.channelItems.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    int newIndex = index;
                    if (index > 0 && index < 3) {
                      newIndex--;
                    }
                    if (index > 3) {
                      newIndex = newIndex - 2;
                    }

                    if (index == 0) {
                      return ChannelHeaderWidget(
                          userController: userController);
                    }
                    if (index == 3) {
                      return const FlicksInChannelsWidget();
                    }
                    ChannelItem channelItem =
                        channelHomeController.channelItems.elementAt(newIndex);
                    return VideoCard(
                      thumbnileUrl: channelItem.strThumbnailUrl,
                      userProfileUrl: channelItem.strUserProfileUrl,
                      duration: channelItem.commentsCount.toString(),
                      time: channelItem.strCreatedTime,
                      title: channelItem.strDescription,
                      views: channelItem.likesCount.toString(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox();
                    }
                    return const Divider();
                  },
                  itemCount: (channelHomeController.channelItems.length) + 2,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}

class ChannelHeaderWidget extends StatelessWidget {
  const ChannelHeaderWidget({
    super.key,
    required this.userController,
  });

  final UserController userController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: SColors.color9,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        userController.userDetailsModel.value!.strProfileUrl),
                  )),
            ),
            title: Text(
              (userController.userDetailsModel.value!.strFullName),
              style: TextStyle(
                color: SColors.color3,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              userController.userDetailsModel.value!.strName,
              style: TextStyle(
                color: SColors.color3,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.search,
                color: SColors.color3,
                size: 30,
              ),
              onPressed: () {},
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            color: SColors.color3,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class FlicksInChannelsWidget extends StatelessWidget {
  const FlicksInChannelsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                SSvgs.flicksLogo,
              ),
              const SizedBox(width: 10),
              Text(
                'Flicks',
                style: TextStyle(
                  color: SColors.color3,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(onTap: () {}, child: FlickSuggestions());
              },
            ),
          ),
        ],
      ),
    );
  }
}
