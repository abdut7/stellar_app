import 'package:base_project/models/api_models/available_contacts_model.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  RxBool isFetchingContacts = RxBool(false);
  RxBool isGettingFromServer = RxBool(false);
  RxBool isErrorOccured = RxBool(false);
  Rx<List<String>> contactList = Rx([]);
  Rx<AvailableContactsModel?> availableContactsModel = Rx(null);
}
