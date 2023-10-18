import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/flicks_suggestions.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/View/channel/channel_view/widgets/video_card_channel_view.dart';
import 'package:stellar_chat/View/flicks/flicks_player_home_screen.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';

class ChannelHomeScreen extends StatefulWidget {
  const ChannelHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChannelHomeScreen> createState() => _ChannelHomeScreenState();
}

class _ChannelHomeScreenState extends State<ChannelHomeScreen> {
  ChannelHomeController channelHomeController =
      Get.put(ChannelHomeController());
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    channelHomeController.fetchNextPage();
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        channelHomeController.fetchNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Obx(
      () => Scaffold(
        body: channelHomeController.channelItems.isNotEmpty
            ? ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  int newIndex = index;
                  if (index > 0 && index < 3) {
                    newIndex--;
                  }
                  if (index > 3) {
                    newIndex = newIndex - 2;
                  }

                  if (index == 0) {
                    return ChannelHeaderWidget(userController: userController);
                  }
                  if (index == 3) {
                    return const FlicksInChannelsWidget();
                  }
                  ChannelItem channelItem =
                      channelHomeController.channelItems.elementAt(newIndex);
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => VideoCardChannelView(
                            channelItem: channelItem,
                          ));
                    },
                    child: VideoCard(
                      channelItem: channelItem,
                    ),
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
      ),
    );
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
                      userController.userDetailsModel.value!.strProfileUrl,
                    ),
                  )),
            ),
            title: Text(
              (userController.userDetailsModel.value!.strFullName),
              style: TextStyle(
                color: Get.find<ThemeController>().isDarkTheme.value
                    ? Colors.white
                    : SColors.color3,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              userController.userDetailsModel.value!.strName,
              style: TextStyle(
                color: Get.find<ThemeController>().isDarkTheme.value
                    ? Colors.white
                    : SColors.color3,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.search,
                color: Get.find<ThemeController>().isDarkTheme.value
                    ? Colors.white
                    : SColors.color3,
                size: 30,
              ),
              onPressed: () {},
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            color: Get.find<ThemeController>().isDarkTheme.value
                ? Colors.white
                : SColors.color3,
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
    FlicksPlayerController flicksController = Get.put(FlicksPlayerController());
    flicksController.loadMore();
    ThemeController themeController = Get.find();
    return Obx(
      () => flicksController.flickItems.isEmpty
          ? const SizedBox()
          : Container(
              height: 160,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
          SvgPicture.asset(
            themeController.isDarkTheme.value ? SSvgs.flicksDark
                : SSvgs.flicksSmall,
            width: themeController.isDarkTheme.value ? 16
                : null,
            height: themeController.isDarkTheme.value ? 17
                : null,
          ),
                      const SizedBox(width: 8,),
                     Text(
                        'Flicks',
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ?  SColors.color4
                              : SColors.color3,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => FlicksPlayerHomeScreen(
                                  isFromChannel: true,
                                  page: index,
                                ));
                          },
                          child: FlickSuggestions(
                            thumbnileUrl: flicksController.flickItems
                                .elementAt(index)
                                .strThumbnailUrl,
                          ),
                        );
                      },
                      itemCount: flicksController.flickItems.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
