import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class AddContactListTile extends StatefulWidget {
  final String text;
  final String subtitle;
  final Function() onPressed;
  final String svgAssetPath;
  final Color? svgColor;


  AddContactListTile({
    required this.text,
    required this.subtitle,
    required this.onPressed,
    required this.svgAssetPath,
    this.svgColor
  });

  @override
  _AddContactListTileState createState() => _AddContactListTileState();
}

class _AddContactListTileState extends State<AddContactListTile> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        onTap: () {
          widget.onPressed();
        },
        leading: SvgPicture.asset(
          widget.svgAssetPath,
          color: widget.svgColor,
        ),
        title: Text(
          widget.text,
          style: TextStyle(
            color:  themeController.isDarkTheme.value
                ?  SColors.color4
                : SColors.color3,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
              fontSize: 11,
              color:  themeController.isDarkTheme.value
                  ?  SColors.buttonTextIndark
                  : SColors.color3,
              fontWeight: FontWeight.w600
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color:  themeController.isDarkTheme.value
                ?  SColors.color4
                : SColors.color3,
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
