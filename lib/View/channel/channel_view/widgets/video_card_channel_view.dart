import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:stellar_chat/View/comment_view/show_comment_bottom_sheet.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
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
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    );
    _chewieController = ChewieController(
      zoomAndPan: true,
      draggableProgressBar: true,
      materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red, bufferedColor: Colors.grey),
      allowPlaybackSpeedChanging: true,
      fullScreenByDefault: false,
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      showControlsOnInitialize: false, // Show controls when the video starts
    );

    _videoPlayerController.addListener(() {
      final position = _videoPlayerController.value.position;

      // Check if the video has been playing for at least 10 seconds
      if (position >= Duration(seconds: 10) && !functionCalled) {
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
    ChannelHomeController channelHomeController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: Get.width * (9 / 16),
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
                        widget.channelItem.description,
                        style: TextStyle(
                          color: SColors.color3,
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
                            child: Image.asset(SImages.shareIcon)),
                        Text(
                          'Share',
                          style: TextStyle(
                            color: SColors.color3,
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
                    Text(widget.channelItem.createdUserFullName),
                    Text(
                      "$followCount Followers",
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (isFollowing) {
                      AccountServices.unFollowUser(widget.channelItem.userId)
                          .then((value) {
                        if (value) {
                          setState(() {
                            isFollowing = false;
                            followCount -= 1;
                          });
                        }
                      });
                    } else {
                      AccountServices.followUser(widget.channelItem.userId)
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
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        isFollowing ? "Unfollow" : "Follow",
                        style: TextStyle(color: secondaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Comments"),
                ),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
    );
  }
}
