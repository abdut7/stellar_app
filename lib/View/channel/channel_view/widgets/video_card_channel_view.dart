import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
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
  @override
  void initState() {
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
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      widget.channelItem.strDescription,
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
                      '${widget.channelItem.commentsCount} views - ${DateFormat('MMM •d, y').format(widget.channelItem.strCreatedTime)}',
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
                          onTap: () {}, child: Image.asset(SImages.shareIcon)),
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
                    NetworkImage(widget.channelItem.strUserProfileUrl),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.channelItem.strCreatedUserFullName),
                  const Text(
                    "200 Followers",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Follow",
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
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => const Text("hello"),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 1000),
          )
        ],
      ),
    );
  }
}
