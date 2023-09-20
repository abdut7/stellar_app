import 'package:base_project/controllers/api_controllers/chat_history_controller.dart';
import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:base_project/services/socket_service/socket_service.dart';
import 'package:get/get.dart';

class ChatHistorySocketService {
  static void chatHistorySocketService() {
    ChatHistoryController chatHistoryController =
        Get.put(ChatHistoryController());
    SocketService socketService = SocketService();
    socketService.socket.on('chat_history', (data) {
      ChatHistoryList newChatHistory = ChatHistoryList.fromJson(data);
      for (var element in chatHistoryController.chatHistoryList) {
        if (element.id == newChatHistory.id) {
          chatHistoryController.chatHistoryList.remove(element);
        }
      }
      chatHistoryController.chatHistoryList.add(newChatHistory);
      print('Schat_history: $data');
    });
  }
}
