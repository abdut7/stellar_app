import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class ContactThrough extends StatefulWidget {
  final String svgAsset;
  final String label;

  ContactThrough({required this.svgAsset, required this.label});

  @override
  _ContactThroughState createState() => _ContactThroughState();
}

class _ContactThroughState extends State<ContactThrough> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Column(
      children: [
        SvgPicture.asset(
          widget.svgAsset,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Inter',
            color: themeController.isDarkTheme.value
                ? SColors.color26
                : SColors.color3,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
