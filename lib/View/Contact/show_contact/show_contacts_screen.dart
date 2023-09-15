import 'package:base_project/View/Contact/AddContact/AddContactUi.dart';
import 'package:base_project/View/Contact/create_group/create_group_screen.dart';
import 'package:base_project/View/Contact/widgets/list_contact_widget.dart';
import 'package:base_project/services/api_services/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/contacts_controller.dart';

class ShowContactsScreen extends StatefulWidget {
  const ShowContactsScreen({super.key});

  @override
  State<ShowContactsScreen> createState() => _ShowContactsScreenState();
}

class _ShowContactsScreenState extends State<ShowContactsScreen> {
  @override
  void initState() {
    ContactServiceApi.getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.find();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
            backgroundColor: Colors.black,
          ),
          body: contactsController.isGetContactLoading.value ||
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
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              width: Get.width * 0.9,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text("Search"),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const CreateGroupScreen());
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 30.0, top: 20),
                              child: Text(
                                "New Group",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //
                              Get.to(() => const AddContactUi());
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 30.0, top: 20),
                              child: Text(
                                "New Contact",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          ListContactsWidget(
                              contactsController: contactsController),
                        ],
                      ),
                    ),
        ));
  }
}
