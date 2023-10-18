import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

Future<dynamic> showChatAttachmentSheet(
    {required BuildContext context,
    required void Function(int) onTap,
    bool isFromPrivate = false}) {
  List<Map<String, String>> attachList = isFromPrivate
      ? [
          {"name": "Send Files", "file": "assets/Svgs/send_files.svg"},
          {"name": "Audio", "file": "assets/Svgs/audio_attach.svg"},
          {"name": "Gallery", "file": "assets/Svgs/gallary_attach.svg"},
          {"name": "Location", "file": "assets/Svgs/location_attach.svg"},
          {"name": "Contacts", "file": "assets/Svgs/contact_attach.svg"},
          {"name": "Pay", "file": "assets/Svgs/pay_icon.svg"}
        ]
      : [
          {"name": "Send Files", "file": "assets/Svgs/send_files.svg"},
          {"name": "Camera", "file": "assets/Svgs/camera_attach.svg"},
          {"name": "Gallery", "file": "assets/Svgs/gallary_attach.svg"},
          {"name": "Location", "file": "assets/Svgs/location_attach.svg"},
          {"name": "Contacts", "file": "assets/Svgs/contact_attach.svg"},
          {"name": "Audio", "file": "assets/Svgs/audio_attach.svg"}
        ];

  return showModalBottomSheet(
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      ThemeController themeController = Get.find();
      return Padding(
          padding:
              EdgeInsets.only(bottom: Get.height * 0.1, left: 12, right: 12),
          child: Container(
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:themeController.isDarkTheme.value
                  ? SColors.darkmode
                  : SColors.color11,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
                crossAxisCount: 3, // 3 elements in each row
              ),
              itemBuilder: (BuildContext context, int index) {
                // Return a grid item here
                return GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: Container(
                    width: Get.width / 4,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(attachList[index]['file']!,),
                          const SizedBox(height: 5,),
                          Text(attachList[index]['name']!,style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color3,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),)
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 6, // Total number of elements
            ),
          ));
    },
  );
}
