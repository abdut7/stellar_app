import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/constants/stickers.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/hive_functions.dart';

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
      backgroundColor:
          themeController.isDarkTheme.value ? SColors.darkmode : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Stickers',
          style: TextStyle(
            fontFamily: 'Inter',
            color: themeController.isDarkTheme.value
                ? SColors.appbarTitleInDark
                : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: themeController.isDarkTheme.value
            ? SColors.appbarbgInDark
            : SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
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
        children: List.generate(stickerGalleryList.length, (index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              // color: SColors.color4,
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: AssetImage(stickerGalleryList
                                    .elementAt(index)
                                    .path), // Add your image URL here
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              appendFavorite(
                                  stickerGalleryList.elementAt(index).path);
                              Get.back();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 51, 142, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Text(
                                  "Add to Favorites",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(159, 196, 232, 1)),
                                ),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: SColors.color4,
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(stickerGalleryList
                        .elementAt(index)
                        .path), // Add your image URL here
                    fit: BoxFit.contain,
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
