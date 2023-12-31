// import 'package:stellar_chat/controllers/api_controllers/chat_history_controller.dart';
// import 'package:stellar_chat/models/api_models/chat_history_model.dart';
import 'package:stellar_chat/controllers/group_chat_controller.dart';
import 'package:stellar_chat/models/group_chat/group_message_model.dart';
import 'package:stellar_chat/services/api_services/chat_history_service.dart';
import 'package:stellar_chat/services/socket_service/socket_service.dart';
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
        ChatHistoryServiceApi.getChatHistory(isRefresh: true);
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
      print(data);
      PrivateMessageModel model = PrivateMessageModel.fromJson(data);
      bool alreadyExist =
          chatController.messageList.any((element) => element.id == model.id);
      if (!alreadyExist) {
        chatController.messageList.add(model);
      }
    });

    //socket for updating goup chats
    socketService.socket.on('get_group_message', (data) {
      print("Recieved group message back");
      print(data);
      GroupChatController chatController = Get.put(GroupChatController());
      // print("Recieved the group message back");
      // print(data);
      GroupMessageModel model = GroupMessageModel.fromJson(data);
      print(model.strMessageType);
      // Check if a model with the same id already exists in the list
      bool alreadyExists = chatController.groupMessageList
          .any((existingModel) => existingModel.id == model.id);
      // chatController.groupMessageList.add(model);
      if (!alreadyExists) {
        // If the model doesn't exist in the list, add it
        chatController.groupMessageList.add(model);
      }
    });
  }
}
