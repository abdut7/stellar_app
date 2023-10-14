import 'package:get/get.dart';
import 'package:stellar_chat/models/api_models/chat_search_model.dart';

class ChatSearchController extends GetxController {
  RxList<MessageSearchModel> messageChatList = RxList();
  RxList<MediaSearchModel> mediaChatList = RxList();
  RxList<AudioSearchModel> audioChatList = RxList();
  RxList<DocumentSearchModel> documentChatList = RxList();
}
