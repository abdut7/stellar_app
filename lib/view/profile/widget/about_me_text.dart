import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';

class AboutMeText extends StatefulWidget {
  const AboutMeText({Key? key}) : super(key: key);

  @override
  State<AboutMeText> createState() => _AboutMeTextState();
}

class _AboutMeTextState extends State<AboutMeText> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    ThemeController themeController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Obx(() => Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'About Me\n',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: themeController.isDarkTheme.value
                        ? SColors.color4
                        : SColors.color3,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: userController.userDetailsModel.value!.strAbout,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: themeController.isDarkTheme.value
                        ? SColors.color4
                        : SColors.color3,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
