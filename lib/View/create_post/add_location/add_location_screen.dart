import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/create_post/tag_people_screen/widget/loaction_search_field.dart';
import 'package:stellar_chat/controllers/new_post/fliq_controller.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          const LocationSearchField(),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                List<String> placeName = ["UAE", "INDIA", "USA"];
                return ListTile(
                  onTap: () {
                    FliqController controller = Get.find();
                    controller.locationName!(placeName[index]);
                    Get.back();
                  },
                  title: Text(placeName[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
