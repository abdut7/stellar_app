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
                      SvgPicture.string(
                          """<svg width="17" height="16" viewBox="0 0 17 16" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_2582_4878)">
          <path d="M11.38 10.6716H8.77337V11.8205H11.38V10.6716Z" fill="#00338E"/>
          <path d="M8.26795 10.6716H5.66137V11.8205H8.26795V10.6716Z" fill="#00338E"/>
          <path d="M8.06769 7.52728V8.43678L8.73523 7.94613L8.06769 7.52728Z" fill="#00338E"/>
          <path d="M11.38 4.04486H8.77337V5.32833H11.38V4.04486Z" fill="#00338E"/>
          <path d="M8.26795 4.04486H5.66137V5.32833H8.26795V4.04486Z" fill="#00338E"/>
          <path d="M8.5 0C3.80497 0 0 3.58115 0 8C0 12.4188 3.80497 16 8.5 16C13.195 16 17 12.4188 17 8C17 3.58115 13.195 0 8.5 0ZM12.661 5.32835C13.0901 5.32835 13.4366 5.65744 13.4366 6.05834V9.97756C13.4366 10.3815 13.0869 10.7076 12.661 10.7076H11.8854V12.1735H13.1696C13.3254 12.1735 13.443 12.2842 13.443 12.4308C13.443 12.5774 13.3254 12.6492 13.1696 12.6492H3.8304C3.67464 12.6492 3.55703 12.5385 3.55703 12.3919C3.55703 12.2453 3.67464 12.1346 3.8304 12.1346H5.11462V10.6687H4.339C3.90987 10.6687 3.56339 10.3396 3.56339 9.93867V6.05834C3.56339 5.65445 3.91305 5.32835 4.339 5.32835H5.11462V3.86238H3.8304C3.67464 3.86238 3.55703 3.75168 3.55703 3.60509C3.55703 3.45849 3.67464 3.34779 3.8304 3.34779H13.1664C13.3222 3.34779 13.4398 3.45849 13.4398 3.60509C13.4398 3.75168 13.3222 3.86238 13.1664 3.86238H11.8822V5.32835H12.6578H12.661Z" fill="#00338E"/>
          <path d="M4.44708 6.35451V9.67837C4.48205 9.77111 4.59013 9.86386 4.69503 9.86386H12.3018C12.4448 9.86386 12.5497 9.77111 12.5497 9.64546V6.35451C12.5497 6.22885 12.4448 6.13611 12.3018 6.13611H4.69503C4.55198 6.13611 4.44708 6.22885 4.44708 6.35451ZM7.35247 6.91995C7.35247 6.7584 7.40969 6.65069 7.58134 6.59983C7.6926 6.54598 7.86743 6.54598 7.98186 6.65368L9.52038 7.72773C9.63164 7.78158 9.69203 7.88929 9.69203 7.99699C9.69203 8.10469 9.63482 8.2124 9.52038 8.26625L7.98186 9.3403C7.86425 9.39415 7.80703 9.44501 7.75299 9.44501C7.69577 9.44501 7.64174 9.44501 7.58134 9.39116C7.40969 9.3373 7.35247 9.2296 7.35247 9.07104V6.91995Z" fill="#00338E"/>
          </g>
          <defs>
          <clipPath id="clip0_2582_4878">
          <rect width="17" height="16" fill="white"/>
          </clipPath>
          </defs>
          </svg>
          """),
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
