import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/utils/colors.dart';

class BottomNavIconWidget extends StatelessWidget {
  final bool isSelected;
  final String svgPath;

  const BottomNavIconWidget({
    super.key,
    required this.svgPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Obx(() => CircleAvatar(
        radius: 25,
        backgroundColor: !isSelected
            ? Colors.transparent
            : themeController.isDarkTheme.value
                ? colorBlack
                : const Color.fromRGBO(0, 51, 142, 1),
        child: SvgPicture.asset(
          svgPath,
          color: themeController.isDarkTheme.value
              ? const Color.fromRGBO(137, 137, 137, 1)
              : null,
        )));
  }
}
