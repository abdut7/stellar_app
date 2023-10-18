import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class StickerGalleryScreen extends StatefulWidget {
  static const routeName = '/StickerGalleryScreen';
  @override
  _StickerGalleryScreenState createState() => _StickerGalleryScreenState();
}

class _StickerGalleryScreenState extends State<StickerGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Stickers',
          style: TextStyle(
            color: themeController.isDarkTheme.value
                ?  SColors.appbarTitleInDark
                : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: themeController.isDarkTheme.value
            ?  SColors.appbarbgInDark
            : SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15,),
          Expanded(
            child: stickerGridView(),
          ),
        ],
      ),
    );
  }

  Widget stickerGridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 2,
        children: List.generate(100, (index) {
          return Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: SColors.color4,
                  borderRadius: BorderRadius.circular(4),
                  image:const  DecorationImage(
                    image: NetworkImage(
                        'https://media.istockphoto.com/id/1267740854/vector/good-job-work-comic-text-sound-effects-pop-art-style-vector-speech-bubble-word-and-short.jpg?s=612x612&w=0&k=20&c=OP5jqKUAXR3J8K813UfYgOn7X5dpbg_DexzMvg2P2Fg='), // Add your image URL here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

}

