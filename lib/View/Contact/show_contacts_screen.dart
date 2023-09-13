import 'package:base_project/models/api_models/get_contacts_model.dart';
import 'package:base_project/services/api_services/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/contacts_controller.dart';

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
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        
                        ObjUser data = contactsController
                            .getContactsModel.value!.arrList[index].objUser[0];
                        return ListTile(
                          title: Text(data.strMobileNo),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: contactsController
                          .getContactsModel.value!.arrList.length),
        ));
  }
}
