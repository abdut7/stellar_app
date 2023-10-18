import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class ProfileButton extends StatefulWidget {
  final String buttonText;
  final Function () onPressed;

  const ProfileButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: 32,
        decoration: BoxDecoration(
          color:  themeController.isDarkTheme.value
              ?  SColors.color26
              : SColors.color12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
                fontSize: 14,
                color: themeController.isDarkTheme.value
                    ?  SColors.color4
                    : SColors.color11,
            ),
          ),
        ),
      ),
    );
  }
}
