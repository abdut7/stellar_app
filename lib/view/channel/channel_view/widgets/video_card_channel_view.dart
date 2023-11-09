import 'package:chewie/chewie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/view/channel/channel_home_screen/widgets/video_card.dart';
import 'package:stellar_chat/view/comment_view/show_comment_bottom_sheet.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:stellar_chat/services/api_services/channel_service.dart';
import 'package:stellar_chat/utils/colors.dart';
import 'package:video_player/video_player.dart';

class VideoCardChannelView extends StatefulWidget {
  const VideoCardChannelView({Key? key, required this.channelItem})
      : super(key: key);
  final ChannelItem channelItem;

  @override
  State<VideoCardChannelView> createState() => _VideoCardChannelViewState();
}

class _VideoCardChannelViewState extends State<VideoCardChannelView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool isFollowing = false;
  int followCount = 0;
  bool functionCalled = false;
  @override
  void initState() {
    isFollowing = widget.channelItem.isFollowing;
    followCount = widget.channelItem.followersCount;

    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.channelItem.fileUrl,
    );
    _chewieController = ChewieController(
      allowMuting: false,
      useRootNavigator: false,
      // zoomAndPan: true,
      draggableProgressBar: true,

      placeholder: Container(
        color: Colors.black,
      ),

      materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          bufferedColor: Colors.grey,
          handleColor: Colors.red),

      allowPlaybackSpeedChanging: true,
      fullScreenByDefault: false,
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,

      showControlsOnInitialize: true, // Show controls when the video starts
    );

    _videoPlayerController.addListener(() {
      final position = _videoPlayerController.value.position;

      // Check if the video has been playing for at least 10 seconds
      if (position >= const Duration(seconds: 10) && !functionCalled) {
        // Call your function here
        ChannelService.addView(channelId: widget.channelItem.id);
        // Set the flag to prevent calling the function multiple times
        functionCalled = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    ChannelHomeController channelHomeController = Get.find();
    UserController userController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * (9 / 16),
                child: Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.channelItem.description.isEmpty
                              ? "No Title"
                              : widget.channelItem.description,
                          style: TextStyle(
                            color: Get.find<ThemeController>().isDarkTheme.value
                                ? Colors.white
                                : SColors.color3,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.channelItem.viewsCount} views - ${DateFormat.yMMMEd().format(
                            DateTime.parse(widget.channelItem.createdTime),
                          )}',
                          style: TextStyle(
                            color: SColors.color8,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.string(
                              """<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15.5 5.63L21.16 12L15.5 18.37V15V14H14.5C10.54 14 7.36 15 4.75 17.09C6.59 13.02 9.86 10.69 14.64 9.99L15.5 9.86V9V5.63ZM14.5 3V9C6.72 10.13 3.61 15.33 2.5 21C5.28 17.03 8.94 15 14.5 15V21L22.5 12L14.5 3Z" fill="#0A0A0A"/>
</svg>
""",
                              color:
                                  Get.find<ThemeController>().isDarkTheme.value
                                      ? Colors.white
                                      : SColors.color3,
                            ),
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                              color:
                                  Get.find<ThemeController>().isDarkTheme.value
                                      ? Colors.white
                                      : SColors.color3,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.channelItem.userProfileUrl),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.channelItem.createdUserFullName,
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "$followCount Followers",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                  const Spacer(),
                  userController.userDetailsModel.value!.id ==
                          widget.channelItem.userId
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            if (isFollowing) {
                              AccountServices.unFollowUser(
                                      widget.channelItem.userId)
                                  .then((value) {
                                if (value) {
                                  setState(() {
                                    isFollowing = false;
                                    followCount -= 1;
                                  });
                                }
                              });
                            } else {
                              AccountServices.followUser(
                                      widget.channelItem.userId)
                                  .then((value) {
                                if (value) {
                                  setState(() {
                                    isFollowing = true;
                                    followCount += 1;
                                  });
                                }
                              });
                            }
                          },
                          child: Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isFollowing
                                  ? const Color.fromRGBO(159, 196, 232, 1)
                                  : colorPrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                isFollowing ? "Following" : "Follow",
                                style: TextStyle(
                                    color: isFollowing
                                        ? const Color.fromARGB(184, 0, 0, 0)
                                        : secondaryColor),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showCommentBottomSheet(
                      context,
                      widget.channelItem.commentsCount,
                      widget.channelItem.id,
                      true);
                },
                child: Container(
                  width: Get.width * 0.9,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Comments",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    ChannelItem channelItem =
                        channelHomeController.channelItems.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.to(() => VideoCardChannelView(
                              channelItem: channelItem,
                            ));
                      },
                      child: VideoCard(
                        channelItem: channelItem,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: channelHomeController.channelItems.length)
            ],
          ),
        ),
      ),
    );
  }
}
