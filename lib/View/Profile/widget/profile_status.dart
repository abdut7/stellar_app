import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class ProfileStatus extends StatefulWidget {
  final String count;
  final String label;

  ProfileStatus({required this.count, required this.label});

  @override
  _ProfileStatusState createState() => _ProfileStatusState();
}

class _ProfileStatusState extends State<ProfileStatus> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Column(
      children: [
        Text(
          widget.count,
          style: TextStyle(
             color: themeController.isDarkTheme.value
                 ?  SColors.color26
                 : SColors.color3,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          widget.label,
          style:  TextStyle(
             color: themeController.isDarkTheme.value
                 ?  SColors.color26
                 : SColors.color3,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
