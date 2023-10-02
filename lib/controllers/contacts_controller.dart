import 'package:base_project/models/api_models/available_contacts_model.dart';
import 'package:get/get.dart';

import '../models/api_models/get_contacts_model.dart';

class ContactsController extends GetxController {
  //fetching from device and uploading to db
  RxBool isFetchingContacts = RxBool(false);
  RxBool isGettingFromServer = RxBool(false);
  RxBool isErrorOccured = RxBool(false);
  //contact list from phone
  Rx<List<String>> contactList = Rx([]);
  // contcat list from backend
  Rx<AvailableContactsModel?> availableContactsModel = Rx(null);
  RxBool creatingContact = RxBool(false);
  RxBool creatingContactDone = RxBool(false);
  RxBool errorCreatingContact = RxBool(false);
  RxList<RecievedPhoneUser> phoneNumberUserList = RxList([]);

  //get contact api controllers

  RxBool isGetContactLoading = RxBool(false);

  RxBool isGetContactErrorOccured = RxBool(false);
  Rx<GetContactsModel?> getContactsModel = Rx(null);
}
