import 'package:get/get.dart';

import '../models/group_chat/group_message_model.dart';

class GroupChatController extends GetxController {
  RxList<GroupMessageModel> groupMessageList = RxList([]);
  RxBool isLoading = RxBool(false);
  RxBool isErrorOccured = RxBool(false);
  int pageNumber = 0;
  bool isEnded = false;
}
