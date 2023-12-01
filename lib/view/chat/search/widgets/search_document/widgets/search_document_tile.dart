import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/services/download_and_open_file.dart';

class SearchDocumentListTile extends StatefulWidget {
  final String fileType;
  final String fileSize;
  final String time;
  final String svgAssetPath;
  final String fileUrl;

  SearchDocumentListTile({
    required this.fileType,
    required this.fileSize,
    required this.time,
    required this.svgAssetPath,
    required this.fileUrl,
  });

  @override
  _SearchDocumentListTileState createState() => _SearchDocumentListTileState();
}

class _SearchDocumentListTileState extends State<SearchDocumentListTile> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return ListTile(
      onTap: () async {
        await downloadCacheAndOpenFile(widget.fileUrl.trim());
        setState(() {});
      },
      leading: SvgPicture.asset(widget.svgAssetPath),
      title: Text(
        widget.fileType,
        style: TextStyle(
          fontFamily: 'Inter',
          color: themeController.isDarkTheme.value
              ? SColors.color4
              : SColors.color3,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        widget.fileSize,
        style: TextStyle(
          fontFamily: 'Inter',
          color: themeController.isDarkTheme.value
              ? SColors.color26
              : SColors.color8,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          widget.time,
          style: TextStyle(
            fontFamily: 'Inter',
            color: themeController.isDarkTheme.value
                ? SColors.color26
                : SColors.color8,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        FutureBuilder(
          future: isFileCached(widget.fileUrl),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              );
            }
            return !snapshot.data! ? Icon(Icons.download) : SizedBox();
          },
        ),
      ]),
    );
  }
}
