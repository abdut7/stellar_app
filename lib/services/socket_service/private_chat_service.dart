import 'dart:math';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:stellar_chat/controllers/contacts_controller.dart';
import 'package:stellar_chat/controllers/private_chat_controller.dart';
import 'package:stellar_chat/functions/image_to_base.dart';
import 'package:stellar_chat/models/private_chat/private_chat_model.dart';
import 'package:stellar_chat/services/api_services/chat_message_service.dart';
import 'package:stellar_chat/services/api_services/upload_file_service.dart';
import 'package:stellar_chat/services/api_services/upload_files.dart';
import 'package:stellar_chat/services/socket_service/socket_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart';

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
    String imageAsBase = await filePathToBase(image.path);
    //upload and take link
    PrivateChatController chatController = Get.put(PrivateChatController());
    chatController.messageList.add(PrivateMessageModel(
        id: "",
        strCreatedTime: "",
        strMessage: "",
        strMessageType: "sentingImage",
        strName: "",
        strType: "",
        strUrl: image.path,
        strUserId: "",
        strContactName: "",
        strContactNumbers: "",
        strChatId: ""));

    String? fileUrl =
        await uploadFiles(fileExtension: null, base64File: imageAsBase);
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
    chatController.messageList.removeLast();
  }

  static Future<void> sentPersonalVoiceMessage(
      {required String chatId, required String path}) async {
    Socket socket = SocketService().socket;

    String? fileUrl = await UploadFileService.uploadFile(filePaths: [path]);

    if (fileUrl == null) {
      return;
    }
    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': "",
      "strMessageType": "voice",
      "strType": "private",
      "strUrl": fileUrl,
    });
    // ChatMessageService.getMessages(chatId: chatId, type: "private");
  }

  static void sentPersonalContactMessage(
      {required String chatId,
      required List numbers,
      required String name}) async {
    Socket socket = SocketService().socket;
    //convert message to base64

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': "",
      "strMessageType": "contact",
      "strType": "private",
      "strUrl": "",
      "strContactNumbers": numbers[0].toString(),
      "strContactName": name
    });
  }

  static Future<void> sentPersonalDocumentMessage(
      {required String chatId, required String path}) async {
    final random = Random();
    Socket socket = SocketService().socket;

    PrivateChatController chatController = Get.find();
    int randomNumber = random.nextInt(1001);
    chatController.messageList.add(PrivateMessageModel(
        id: "$randomNumber",
        strCreatedTime: "",
        strMessage: basename(path),
        strMessageType: "sentingDoc",
        strName: "",
        strType: "",
        strUrl: "",
        strUserId: "",
        strContactName: "",
        strContactNumbers: "",
        strChatId: ""));
    String? fileUrl = await UploadFileService.uploadFile(filePaths: [path]);
    if (fileUrl == null) {
      return;
    }
    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': basename(path),
      "strMessageType": "document",
      "strType": "private",
      "strUrl": fileUrl,
    });
    // ChatMessageService.getMessages(chatId: chatId, type: "private");
    chatController.messageList
        .removeWhere((element) => element.id == randomNumber.toString());
  }
}
