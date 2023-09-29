import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/create_post/tag_people_screen/widget/search_field.dart';
import 'package:base_project/View/create_post/tag_people_screen/widget/tag_people_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagPeopleScreen extends StatefulWidget {
  const TagPeopleScreen({Key? key}) : super(key: key);

  @override
  State<TagPeopleScreen> createState() => _TagPeopleScreenState();
}

class _TagPeopleScreenState extends State<TagPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SColors.color18,
        leading: IconButton(
          icon: Icon(
            Icons.cancel_outlined, color: SColors.color3,),
          onPressed: () {},
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              'Next',
              style: TextStyle(color: SColors.color12, fontSize: 16, fontWeight: FontWeight.w400,),),
          ),
          Icon(Icons.arrow_forward_ios, color: SColors.color3, size: 18,),
        ],
      ),
      body: ListView(
        children: [
          const SearchField(),
          const SizedBox(height: 10,),
          Container(
            width: Get.width, height: 390, decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380"), fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text('Tags', style: TextStyle(color: SColors.color12, fontSize: 16, fontWeight: FontWeight.w500,),
            ),
          ),
         const TagPeopleTile(username: 'Abd_Rash', name: 'Abdul Rasheed'),
         const TagPeopleTile(username: 'JSimon1990', name: 'Jacob Simon'),
         const TagPeopleTile(username: 'Thomas D_vid', name: 'David Thomas'),
        ],
      ),
    );
  }
}
