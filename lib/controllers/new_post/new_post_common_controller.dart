import 'package:get/get.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';

class NewPostController extends GetxController {
  RxSet<Contact> tagPeople = RxSet();
  RxList<Contact> searchList = RxList();
  RxBool isSearching = RxBool(false);
  RxString locationName = RxString("");
  RxString caption = RxString("");
  RxBool hideLikeAndView = RxBool(false);
  RxBool hideComments = RxBool(false);
  RxBool isUploading = RxBool(false);
  RxBool isPosting = RxBool(false);
  RxInt uploadPercentage = RxInt(0);
  RxBool isCancelled = RxBool(false);
  RxBool isUploaded = RxBool(false);
}
