import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:base_project/View/channel/channel_view/widgets/tile1.dart';
import 'package:base_project/View/comment_view/tile2.dart';
import 'package:base_project/View/channel/channel_view/widgets/video_card_channel_view.dart';
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
      const SizedBox(height: 10,),
      Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 25), child: Divider(color: SColors.color9,),),
          const Tile1(),
          Padding(padding:const  EdgeInsets.symmetric(horizontal: 25), child: Divider(color: SColors.color9,),),
          const MainTile(),
          const SizedBox(height: 10,),
          const VideoCard(),
          const VideoCard(),

        ],
      ),
    );
  }
}
