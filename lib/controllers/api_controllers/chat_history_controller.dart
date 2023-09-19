import 'package:get/get.dart';

import '../../models/api_models/chat_history_model.dart';

class ChatHistoryController extends GetxController {
  RxList<ChatHistoryList> chatHistoryList = RxList([]);
  RxBool isLoading = RxBool(false);
  RxBool errorOccured = RxBool(false);
}
