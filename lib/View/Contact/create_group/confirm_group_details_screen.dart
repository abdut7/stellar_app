import 'package:base_project/View/Contact/create_group/widgets/add_group_icon_widget.dart';
import 'package:base_project/View/base_bottom_nav/bottom_nav.dart';
import 'package:base_project/functions/show_snackbar.dart';
import 'package:base_project/services/api_services/group_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../models/api_models/get_contacts_model.dart';

class ConfirmGroupDetailsScreen extends StatefulWidget {
  final XFile? groupIcon;
  final List<String> userIdList;
  final List<ObjUser> userModelList;
  final String groupName;
  const ConfirmGroupDetailsScreen(
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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AddGroupIconWidget(
          file: widget.groupIcon,
        ),
        SizedBox(
          height: Get.height * 0.5,
          width: Get.width * 0.9,
          child: Expanded(
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
        ),
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
        )
      ],
    ));
  }
}
