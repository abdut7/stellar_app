import 'package:stellar_chat/models/private_chat/private_chat_model.dart';
import 'package:get/get.dart';

class PrivateChatController extends GetxController {
  RxList<PrivateMessageModel> messageList = RxList([]);
  RxBool isLoading = RxBool(false);
  RxBool isLoadingFailed = RxBool(false);
}
