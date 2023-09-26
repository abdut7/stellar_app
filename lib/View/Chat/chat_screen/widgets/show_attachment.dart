import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Future<dynamic> show_attachment(
    BuildContext context, void Function(int) onTap) {
  List<Map<String, String>> attachList = [
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
      return Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.1, left: 12, right: 12),
        child: Container(
            height: 230,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(159, 196, 232, 1)),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                crossAxisCount: 3, // 3 elements in each row
              ),
              itemBuilder: (BuildContext context, int index) {
                // Return a grid item here
                return GestureDetector(
                  onTap: () {
                    onTap(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SvgPicture.asset(attachList[index]['file']!),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(attachList[index]['name']!)
                      ],
                    ),
                  ),
                );
              },
              itemCount: 6, // Total number of elements
            )),
      );
    },
  );
}
