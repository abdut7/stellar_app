import 'dart:typed_data';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/create_post/flicks/tag_people_screen/widget/tag_search_field.dart';
import 'package:stellar_chat/View/create_post/flicks/tag_people_screen/widget/tag_people_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/new_post/new_post_common_controller.dart';

class TagPeopleScreen extends StatefulWidget {
  const TagPeopleScreen(
      {Key? key, required this.videoFilePath, required this.thumbnile})
      : super(key: key);
  final String videoFilePath;
  final Uint8List thumbnile;

  @override
  State<TagPeopleScreen> createState() => _TagPeopleScreenState();
}

class _TagPeopleScreenState extends State<TagPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    NewPostController newPostController = Get.find();
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SColors.color18,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: IconButton(
            icon: SvgPicture.string(
                """<svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <line x1="1.70711" y1="1.29289" x2="14.7071" y2="14.2929" stroke="black" stroke-width="2"/>
        <line y1="-1" x2="18.3848" y2="-1" transform="matrix(-0.707107 0.707107 0.707107 0.707107 15 2)" stroke="black" stroke-width="2"/>
        </svg>
        """),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Next',
              style: TextStyle(
                color: SColors.color12,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: SColors.color3,
            size: 18,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TagSearchField(),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   width: Get.width,
          //   height: 390,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: MemoryImage(widget.thumbnile),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Tags',
              style: TextStyle(
                color: SColors.color12,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Obx(() => !newPostController.isSearching.value
              ? Expanded(
                  child: ListView.builder(
                    itemCount: newPostController.tagPeople.length,
                    itemBuilder: (context, index) {
                      return TagPeopleTile(
                        name: newPostController.tagPeople
                            .elementAt(index)
                            .strMobileNo,
                        username: newPostController.tagPeople
                            .elementAt(index)
                            .strFullName,
                        contact: newPostController.tagPeople.elementAt(index),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: newPostController.searchList.length,
                    itemBuilder: (context, index) {
                      return TagPeopleTile(
                        isSearch: true,
                        name: newPostController.searchList
                            .elementAt(index)
                            .strMobileNo,
                        username: newPostController.searchList
                            .elementAt(index)
                            .strFullName,
                        contact: newPostController.searchList.elementAt(index),
                      );
                    },
                  ),
                ))
        ],
      ),
    );
  }
}
