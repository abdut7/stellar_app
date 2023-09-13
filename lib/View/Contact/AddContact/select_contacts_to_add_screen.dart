import 'package:base_project/functions/get_contacts.dart';
import 'package:flutter/material.dart';
import 'package:base_project/controllers/contacts_controller.dart';
import 'package:get/get.dart';

import '../../../models/api_models/available_contacts_model.dart';

class SelectContacts extends StatefulWidget {
  final ContactsController controller;
  const SelectContacts({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SelectContacts> createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  @override
  void initState() {
    getContacts();
    super.initState();
  }

  List<String> selectedId = [];

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.find();

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
                        itemCount: contactsController
                            .availableContactsModel.value!.arrList.length),
        floatingActionButton: selectedId.isEmpty
            ? null
            : Container(
                width: Get.width * 0.5,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Add Contacts",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
