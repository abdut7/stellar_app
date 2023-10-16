import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/new_post/new_post_common_controller.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';

class TagPeopleTile extends StatelessWidget {
  final String username;
  final String name;
  final bool isSearch;
  final Contact contact;
  const TagPeopleTile(
      {Key? key,
      required this.username,
      required this.name,
      this.isSearch = false,
      required this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: SColors.color9,
          radius: 25,
          backgroundImage: NetworkImage(contact.strProfileUrl),
        ),
        title: Text(
          username,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          name,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: isSearch
            ? Text("Tag")
            : GestureDetector(
                onTap: () {
                  NewPostController cont = Get.find();
                  cont.tagPeople.remove(contact);
                },
                child: Icon(
                  Icons.cancel,
                  color: SColors.color3,
                  size: 20,
                ),
              ),
        onTap: () {
          if (isSearch) {
            NewPostController cont = Get.find();
            cont.tagPeople.add(contact);
            cont.searchList.clear();
            cont.isSearching(false);
          }
        },
      ),
    );
  }
}
