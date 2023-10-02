import 'package:stellar_chat/View/Contact/create_group/widgets/add_group_icon_widget.dart';
import 'package:stellar_chat/View/base_bottom_nav/bottom_nav.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:stellar_chat/services/api_services/group_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../models/api_models/get_contacts_model.dart';

// ignore: must_be_immutable
class ConfirmGroupDetailsScreen extends StatefulWidget {
  XFile? groupIcon;
  final List<String> userIdList;
  final List<Contact> userModelList;
  final String groupName;
  ConfirmGroupDetailsScreen(
      {super.key,
      this.groupIcon,
      required this.userIdList,
      required this.userModelList,
      required this.groupName});

  @override
  State<ConfirmGroupDetailsScreen> createState() =>
      _ConfirmGroupDetailsScreenState();
}

class _ConfirmGroupDetailsScreenState extends State<ConfirmGroupDetailsScreen> {
  ImagePicker picker = ImagePicker();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: Get.height * 0.15,
        ),
        GestureDetector(
          onTap: () async {
            widget.groupIcon =
                await picker.pickImage(source: ImageSource.gallery);
            if (widget.groupIcon != null) {
              setState(() {});
            }
          },
          child: AddGroupIconWidget(
            file: widget.groupIcon,
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget.userModelList[index].strFullName)
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: widget.userModelList.length)),
        GestureDetector(
          onTap: () async {
            setState(() {
              isLoading = true;
            });
            bool isSuccess = await GroupServices.createGroup(
                widget.userIdList, widget.groupName, widget.groupIcon);
            if (isSuccess) {
              Get.offAll(() => const BaseBottomNavigation());
            } else {
              showCustomSnackbar(
                  title: "Group Creation Failed",
                  message: "Please try again later");
            }

            setState(() {
              isLoading = false;
            });
          },
          child: Container(
            width: Get.width * 0.6,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: isLoading
                ? Center(
                    child: LoadingAnimationWidget.threeRotatingDots(
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                : const Center(
                    child: Text(
                      "Create New Group",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.1,
        ),
      ],
    ));
  }
}
