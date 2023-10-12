import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:stellar_chat/View/channel/channel_view/widgets/tile1.dart';
import 'package:stellar_chat/View/comment_view/main_tile.dart';
import 'package:stellar_chat/View/channel/channel_view/widgets/video_card_channel_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChannelViewScreen extends StatefulWidget {
  const ChannelViewScreen({Key? key}) : super(key: key);

  @override
  State<ChannelViewScreen> createState() => _ChannelViewScreenState();
}

class _ChannelViewScreenState extends State<ChannelViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: ListView(
        children: [
          const VideoCardChannelView(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              color: SColors.color9,
            ),
          ),
          const Tile1(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              color: SColors.color9,
            ),
          ),
          MainTile(
            comment: "This is my comment",
            commenterName: "Joel Mathew",
            isLiked: true,
            id: "myID",
            onLiked: () {
              print("like pressed");
            },
            time: "22hr",
            commenterProfileUrl:
                "https://loremflickr.com/cache/resized/65535_52627441448_842afe99e3_z_640_360_nofilter.jpg",
                flickId: "",
          ),
          const SizedBox(
            height: 10,
          ),
          const VideoCard(),
          const VideoCard(),
        ],
      ),
    );
  }
}
