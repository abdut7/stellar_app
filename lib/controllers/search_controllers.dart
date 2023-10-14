import 'package:get/get.dart';
import 'package:stellar_chat/models/api_models/chat_search_model.dart';

class ChatSearchController extends GetxController {
  RxList<SearchFiles> messageChatList = RxList();
  RxList<SearchFiles> mediaChatList = RxList();
  RxList<SearchFiles> audioChatList = RxList();
  RxList<SearchFiles> documentChatList = RxList();
  RxBool isLoading = RxBool(false);
}
