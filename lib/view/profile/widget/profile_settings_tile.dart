import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class CustomListTilee extends StatefulWidget {
  final String text;
  final Function() onTap;
  final String svgAsset;

  CustomListTilee({
    required this.text,
    required this.onTap,
    required this.svgAsset,
  });

  @override
  _CustomListTileeState createState() => _CustomListTileeState();
}

class _CustomListTileeState extends State<CustomListTilee> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          leading: SvgPicture.asset(
            widget.svgAsset,
            width: 45,
            height: 45,
          ),
          title: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Inter',
              color: themeController.isDarkTheme.value
                  ? SColors.color4
                  : SColors.color3,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
