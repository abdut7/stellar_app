import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/chat/search/widgets/search_audio/widget/search_audio_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/search_controllers.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class SearchAudioScreen extends StatefulWidget {
  @override
  State<SearchAudioScreen> createState() => _SearchAudioScreenState();
}

class _SearchAudioScreenState extends State<SearchAudioScreen> {
  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        thickness: 0.7,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    // ChatSearchController searchController = Get.find();

    return Scaffold(
      backgroundColor:themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      body: ListView(
        children: [
          SearchAudioListTile(
              onPressed: () {},
              fileType: 'audio.mp3',
              fileSize: '3 mb - mp3',
              time: '11:35 am'),
          divider(),
          SearchAudioListTile(
              onPressed: () {},
              fileType: 'audio.mp3',
              fileSize: '4 mb - mp3',
              time: '11:25 am'),
          divider(),
        ],
      ),
    );
  }
}
