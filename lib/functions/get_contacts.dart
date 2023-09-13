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
  List<String> contactPhoneNumber = [];
  for (Contact contact in contacts) {
    if (contact.phones != null) {
      for (Item phone in contact.phones!) {
        contactPhoneNumber.add(phone.value ?? '');
      }
    }
  }

  contactsController.contactList(contactPhoneNumber);
  contactsController.isFetchingContacts(false);
  ContactServiceApi.contactService(contactPhoneNumber);
}
