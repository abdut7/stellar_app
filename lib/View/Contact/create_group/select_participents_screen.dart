import 'package:base_project/View/Contact/create_group/confirm_group_details_screen.dart';
import 'package:base_project/View/Contact/create_group/widgets/add_user_group_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/contacts_controller.dart';
import '../../../models/api_models/get_contacts_model.dart';

class SelectGroupParticipents extends StatefulWidget {
  final XFile? image;
  final String grpName;
  const SelectGroupParticipents({super.key, this.image, required this.grpName});

  @override
  State<SelectGroupParticipents> createState() =>
      _SelectGroupParticipentsState();
}

class _SelectGroupParticipentsState extends State<SelectGroupParticipents> {
  @override
  void initState() {
    super.initState();
  }

  List<String> selectedUsers = [];
  List<Contact> selectedUserModel = [];

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.put(ContactsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Members"),
      ),
      body: Obx(
        () => SizedBox(
          child: contactsController.isGetContactLoading.value ||
                  contactsController.getContactsModel.value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : contactsController.getContactsModel.value!.arrList.isEmpty
                  ? const Center(
                      child: Text("No Contacts added add now"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              width: Get.width * 0.9,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Search"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Contact user = contactsController
                                  .getContactsModel.value!.arrList[index];
                              Contact arrList = contactsController
                                  .getContactsModel.value!.arrList[index];

                              return GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      if (selectedUsers.contains(arrList.id)) {
                                        selectedUsers.remove(arrList.id);
                                        selectedUserModel.remove(user);
                                      } else {
                                        selectedUsers.add(arrList.id);
                                        selectedUserModel.add(user);
                                      }
                                    },
                                  );
                                },
                                child: AddUserGroupTileWidget(
                                    user: user,
                                    isSelcted:
                                        selectedUsers.contains(arrList.id)),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: contactsController
                                .getContactsModel
                                .value!
                                .arrList
                                .length, // Replace with your actual item count
                          ),
                        ],
                      ),
                    ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedUsers.isNotEmpty
          ? GestureDetector(
              onTap: () {
                Get.to(() => ConfirmGroupDetailsScreen(
                      userIdList: selectedUsers,
                      userModelList: selectedUserModel,
                      groupIcon: widget.image,
                      groupName: widget.grpName,
                    ));
              },
              child: Container(
                width: Get.width * 0.5,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text("Next"),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
