import 'package:base_project/controllers/private_chat_controller.dart';
import 'package:base_project/functions/image_to_base.dart';
import 'package:base_project/services/api_services/upload_files.dart';
import 'package:base_project/services/socket_service/socket_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  static void sentPersonalImageMessage(String chatId, XFile image) async {
    Socket socket = SocketService().socket;
    //convert message to base64
    String imageAsBase = await imageToBase(image.path);
    //upload and take link
    String? fileUrl = await uploadFiles(base64File: imageAsBase);
    if (fileUrl == null) {
      return;
    }
    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': "",
      "strMessageType": "image",
      "strType": "private",
      "strUrl": fileUrl
    });
  }
}
