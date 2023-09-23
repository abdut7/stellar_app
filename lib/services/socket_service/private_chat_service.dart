import 'package:base_project/controllers/private_chat_controller.dart';
import 'package:base_project/services/socket_service/socket_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../models/private_chat/private_chat_model.dart';

class PrivateChatService {
  static void sentPersonalTextMessage(String chatId, String message) {
    print(chatId);
    print(message);
    Socket socket = SocketService().socket;

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': message,
      "strMessageType": "text",
      "strType": "private",
    });
  }

}
