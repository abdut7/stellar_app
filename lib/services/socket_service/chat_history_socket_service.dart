// import 'package:base_project/controllers/api_controllers/chat_history_controller.dart';
// import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:base_project/controllers/group_chat_controller.dart';
import 'package:base_project/models/group_chat/group_message_model.dart';
import 'package:base_project/services/socket_service/socket_service.dart';
import 'package:get/get.dart';

import '../../controllers/private_chat_controller.dart';
import '../../models/private_chat/private_chat_model.dart';

class ChatHistorySocketService {
  static void chatHistorySocketService() {
    PrivateChatController chatController = Get.put(PrivateChatController());

    // ChatHistoryController chatHistoryController =
    //     Get.put(ChatHistoryController());
    SocketService socketService = SocketService();

    // socket for updating chat history
    socketService.socket.on(
      'chat_history',
      (data) {
        print("Chat history updated");
        // ChatHistoryList newChatHistory = ChatHistoryList.fromJson(data);
        // for (var element in chatHistoryController.chatHistoryList) {
        //   if (element.id == newChatHistory.id) {
        //     chatHistoryController.chatHistoryList.remove(element);
        //   }
        // }
        // chatHistoryController.chatHistoryList.add(newChatHistory);
        // newChatHistory.toString();
        // print(data);
      },
    );

    //socket for updating private chats
    socketService.socket.on('get_message', (data) {
      print("Recieved the message back");
      PrivateMessageModel model = PrivateMessageModel.fromJson(data);
      chatController.messageList.add(model);
    });

    //socket for updating goup chats
    socketService.socket.on('get_group_message', (data) {
      GroupChatController chatController = Get.put(GroupChatController());
      print("Recieved the group message back");
      print(data);
      GroupMessageModel model = GroupMessageModel.fromJson(data);
      chatController.groupMessageList.add(model);
    });
  }
}
