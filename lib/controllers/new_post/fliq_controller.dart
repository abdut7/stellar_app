import 'package:get/get.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';

class FliqController extends GetxController {
  RxSet<Contact> tagPeople = RxSet();
  RxList<Contact> searchList = RxList();
  RxBool isSearching = RxBool(false);
  RxString? locationName;
  RxString caption = RxString("");
  RxBool hideLikeAndView = RxBool(false);
  RxBool hideComments = RxBool(false);
}
