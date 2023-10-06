import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
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
      backgroundColor: SColors.color4,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          title: Text(
            'New Group',
            style: TextStyle(color: SColors.color11, fontSize: 18, fontWeight: FontWeight.w700,),),
          backgroundColor: SColors.color12,
          leading: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(SSvgs.appLogo),
          ),
        ),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.05,),
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
        const SizedBox(height: 15,),
        const Center(
          child: Text(
            'Group Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 30,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '40/128 MEMBERS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40,),
        Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                         CircleAvatar(
                           radius: 18,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(widget.userModelList[index].strFullName,
                        style:  const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(thickness: 0,color: Colors.white,),
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
          child: Center(
            child: Container(
              width: Get.width * 0.7,
              height: 45,
              decoration: BoxDecoration(
                color: SColors.color12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isLoading
                  ? Center(
                      child: LoadingAnimationWidget.threeRotatingDots(
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  :  Center(
                      child: Text(
                        "Create New Group",
                        style: TextStyle(
                          color: SColors.color11,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.1),
      ],
    ));
  }
}
