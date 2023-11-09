import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class SearchAudioListTile extends StatefulWidget {
  final String fileType;
  final String fileSize;
  final String time;
  final Function()? onPressed;

  SearchAudioListTile(
      {required this.fileType,
      required this.fileSize,
      required this.time,
      this.onPressed});

  @override
  _SearchAudioListTileState createState() => _SearchAudioListTileState();
}

class _SearchAudioListTileState extends State<SearchAudioListTile> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return ListTile(
      onTap: widget.onPressed,
      leading: SvgPicture.asset(
          SSvgs.audioLogo), // Make sure SSvgs.audioLogo is defined
      title: Text(
        widget.fileType,
        style: TextStyle(
          color: themeController.isDarkTheme.value
              ?  SColors.color4
              : SColors.color3,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        widget.fileSize,
        style: TextStyle(
          color: themeController.isDarkTheme.value
              ?  SColors.color26
              : SColors.color8,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        widget.time,
        style: TextStyle(
          color: themeController.isDarkTheme.value
              ?  SColors.color26
              : SColors.color8,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
