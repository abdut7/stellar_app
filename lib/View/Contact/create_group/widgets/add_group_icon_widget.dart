import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class AddGroupIconWidget extends StatelessWidget {
  final XFile? file;
  const AddGroupIconWidget({
    super.key,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Center(
      child: file == null
          ?  DottedBorder(
        color: themeController.isDarkTheme.value
            ?  SColors.color4
            : SColors.color3,
              borderType: BorderType.Circle,
              dashPattern: const [5, 10],
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 150,
                width: 150,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(SSvgs.newGroupProfile),
              ))
          : DottedBorder(
        borderType: BorderType.Circle,
        dashPattern: const [5, 10],
            child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.withOpacity(0.3),
                backgroundImage: Image.file(
                  File(file!.path),
                ).image,
              ),
          ),
    );
  }
}
