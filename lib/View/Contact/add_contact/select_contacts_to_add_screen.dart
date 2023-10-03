import 'package:stellar_chat/functions/get_contacts.dart';
import 'package:stellar_chat/services/api_services/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/controllers/contacts_controller.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../models/api_models/available_contacts_model.dart';

class SelectContacts extends StatefulWidget {
  const SelectContacts({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectContacts> createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  @override
  void initState() {
    getContactsFromPhone();
    super.initState();
  }

  List<String> selectedId = [];

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.put(ContactsController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Select Contacts"),
        ),
        body: contactsController.isFetchingContacts.value
            ? const Center(
                child: Text("Uploading contacts"),
              )
            : contactsController.isGettingFromServer.value
                ? const Center(
                    child: Text("Geting Users"),
                  )
                : contactsController.isErrorOccured.value
                    ? const Center(
                        child: Text("Erroro occured"),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          ArrList item = contactsController
                              .availableContactsModel.value!.arrList[index];
                          return ListTile(
                            onTap: () {
                              setState(() {
                                if (selectedId.contains(item.id)) {
                                  selectedId.remove(item.id);
                                } else {
                                  selectedId.add(item.id);
                                }
                              });
                            },
                            leading: Radio(
                              groupValue: selectedId.contains(item.id),
                              value: true,
                              onChanged: (e) {},
                            ),
                            selected: selectedId.contains(item.id),
                            title: Text(item.strFullName),
                            subtitle: Text(item.strMobileNo),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            contactsController.phoneNumberUserList.length),
        floatingActionButton: selectedId.isEmpty
            ? null
            : GestureDetector(
                onTap: () {
                  ContactServiceApi.createContact(selectedId);
                },
                child: Container(
                  width: Get.width * 0.5,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Obx(() {
                    return Center(
                        child: contactsController.creatingContact.value
                            ? LoadingAnimationWidget.threeRotatingDots(
                                color: Colors.white,
                                size: 40,
                              )
                            : Text(
                                "Add Contacts",
                                style: TextStyle(color: Colors.white),
                              ));
                  }),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
