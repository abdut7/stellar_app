import 'package:base_project/functions/get_contacts.dart';
import 'package:flutter/material.dart';
import 'package:base_project/controllers/contacts_controller.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.find();

    return Obx(() => Scaffold(
          body: contactsController.isFetchingContacts.value
              ? Center(
                  child: Text("Uploading contacts"),
                )
              : contactsController.isGettingFromServer.value
                  ? Center(
                      child: Text("Geting Users"),
                    )
                  : contactsController.isErrorOccured.value
                      ? Center(
                          child: Text("Erroro occured"),
                        )
                      : Center(
                          child: Text("Success"),
                        ),
        ));
  }
}
