import 'package:base_project/services/api_services/contacts_service.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/contacts_controller.dart';

Future<void> getContacts() async {
  ContactsController contactsController = Get.find();
  contactsController.isFetchingContacts(true);
  List<Contact> contacts = [];
  if (await Permission.contacts.request().isGranted) {
    contacts = await ContactsService.getContacts();
  }
  Set<String> contactPhoneNumber = {};
  for (Contact contact in contacts) {
    if (contact.phones != null) {
      for (Item phone in contact.phones!) {
        if (phone.value != null) {
          String filterdVal = phone.value!.replaceAll(RegExp(r'[^\d]'), '');
          if (filterdVal.length == 12) {
            filterdVal = filterdVal.substring(2);
          }
          contactPhoneNumber.add(filterdVal);
        }
      }
    }
  }

  contactsController.contactList(
    contactPhoneNumber.toList(),
  );
  contactsController.isFetchingContacts(false);
  ContactServiceApi.contactService(
    contactPhoneNumber.toList(),
  );
}
