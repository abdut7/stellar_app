import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class ProfileUpdateButton extends StatefulWidget {
  final String buttonText;
  final Function () onPressed;

  const ProfileUpdateButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ProfileUpdateButtonState createState() => _ProfileUpdateButtonState();
}

class _ProfileUpdateButtonState extends State<ProfileUpdateButton> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 40,
        decoration: BoxDecoration(
          color: themeController.isDarkTheme.value ?  Colors.black : SColors.color12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(fontSize: 14,
                color: themeController.isDarkTheme.value ?  SColors.buttonTextIndark : SColors.color11,),
          ),
        ),
      ),
    );
  }
}
