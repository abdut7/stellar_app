import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/Contact/create_group/confirm_group_details_screen.dart';
import 'package:stellar_chat/View/Contact/create_group/widgets/add_user_group_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:stellar_chat/services/api_services/group_service.dart';
import 'package:stellar_chat/utils/colors.dart';
import 'package:stellar_chat/widgets/search_text_field.dart';

import '../../../controllers/contacts_controller.dart';
import '../../../models/api_models/get_contacts_model.dart';

class SelectGroupParticipents extends StatefulWidget {
  final bool isCreatedGroup;
  final String? groupId;
  final XFile? image;
  final String grpName;
  const SelectGroupParticipents(
      {super.key,
      this.image,
      required this.grpName,
      this.isCreatedGroup = false,
      this.groupId = ''});

  @override
  State<SelectGroupParticipents> createState() =>
      _SelectGroupParticipentsState();
}

class _SelectGroupParticipentsState extends State<SelectGroupParticipents> {
  @override
  void initState() {
    super.initState();
    if (widget.isCreatedGroup) {
      GroupServices.getAddParticipentsContacts(groupId: widget.groupId!);
    }
  }

  List<String> selectedUsers = [];
  List<Contact> selectedUserModel = [];

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    ContactsController contactsController = Get.find();
    Set<Contact> myContact = {};

    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isCreatedGroup ? widget.grpName : 'New Group',
              style: TextStyle(
                color:themeController.isDarkTheme.value
                    ?  SColors.appbarTitleInDark
                    : SColors.color11,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Add Participants',
              style: TextStyle(
                color:themeController.isDarkTheme.value
                    ?  SColors.appbarTitleInDark
                    : SColors.color11,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        backgroundColor: themeController.isDarkTheme.value
            ?  SColors.appbarbgInDark
            : SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
      ),
      body: Column(
        children: [
          const SearchTextField(
            isFromContacts: true,
          ),
          Obx(
            () {
              if (contactsController.phoneNumberUserList.isNotEmpty &&
                  !contactsController.isGetContactLoading.value) {
                myContact.clear();
                contactsController.phoneNumberUserList
                    .forEach((incomingElement) {
                  // Check if an element with the same ID exists in myContact
                  bool alreadyExists = myContact
                      .any((element) => element.id == incomingElement.id);

                  if (!alreadyExists) {
                    // If it doesn't exist, add it to myContact
                    myContact.add(incomingElement);
                  }
                });
              }
              return SizedBox(
                child: contactsController.isGetContactLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : myContact.isEmpty
                        ? const Center(
                            child: Text("No Contacts added add now"),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //const SizedBox(height: 5),
                                //search here

                                //const SizedBox(height: 20,),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    Contact user = myContact.elementAt(index);

                                    return InkWell(
                                      onTap: () {
                                        setState(
                                          () {
                                            if (selectedUsers
                                                .contains(user.id)) {
                                              selectedUsers.remove(user.id);
                                              selectedUserModel.remove(user);
                                            } else {
                                              selectedUsers.add(user.id);
                                              selectedUserModel.add(user);
                                            }
                                          },
                                        );
                                      },
                                      child: SizedBox(
                                        height: 50,
                                        child: AddUserGroupTileWidget(
                                            user: user,
                                            isSelcted: selectedUsers
                                                .contains(user.id)),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                     Divider(
                                    thickness: 0,
                                    color:themeController.isDarkTheme.value
                                        ?  SColors.darkmode
                                        : SColors.color4,
                                  ),
                                  itemCount: myContact.length,
                                ),
                              ],
                            ),
                          ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: selectedUsers.isNotEmpty
          ? GestureDetector(
              onTap: () async {
                if (widget.isCreatedGroup) {
                  bool isAdded = await GroupServices.addParticipents(
                      uid: selectedUsers, chatID: widget.groupId!);
                  if (isAdded) {
                    Get.back();
                    Get.back();
                    showCustomSnackbar(
                        title: "Success", message: "Users added succesfuly");
                  } else {
                    Get.back();
                    showCustomSnackbar(
                        title: "Adding participents failed",
                        message: "Please try again");
                  }
                  return;
                }
                Get.to(() => ConfirmGroupDetailsScreen(
                      userIdList: selectedUsers,
                      userModelList: selectedUserModel,
                      groupIcon: widget.image,
                      groupName: widget.grpName,
                    ));
              },
              child: Container(
                  // width: Get.width * 0.5,
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: themeController.isDarkTheme.value
                          ? Color(0xFF939393)
                          : SColors.color11,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  )),
            )
          : const SizedBox(),
    );
  }
}
