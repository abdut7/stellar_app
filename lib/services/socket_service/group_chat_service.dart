import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:stellar_chat/controllers/group_chat_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/functions/delete_audio_file.dart';
import 'package:stellar_chat/functions/image_to_base.dart';
import 'package:stellar_chat/models/group_chat/group_message_model.dart';
import 'package:stellar_chat/services/api_services/upload_file_service.dart';
import 'package:stellar_chat/services/api_services/upload_files.dart';
import 'package:stellar_chat/services/socket_service/socket_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart';

class GroupChatService {
  static void sentGroupTextMessage(String chatId, String message) {
    Socket socket = SocketService().socket;

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': message,
      "strMessageType": "text",
      "strType": "group",
    });
  }

  static void sentGroupImageMessage(String chatId, XFile image) async {
    Socket socket = SocketService().socket;
    //convert message to base64
    String imageAsBase = await filePathToBase(image.path);
    //upload and take link
    String? fileUrl =
        await uploadFiles(fileExtension: null, base64File: imageAsBase);
    if (fileUrl == null) {
      return;
    }

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': "",
      "strMessageType": "image",
      "strType": "group",
      "strUrl": fileUrl
    });
  }

  static void sentGroupVoiceMessage(
      {required String chatId, required String path}) async {
    Socket socket = SocketService().socket;
    //upload and take link
    String? fileUrl = await UploadFileService.uploadFile(filePaths: [path]);
    if (fileUrl == null) {
      return;
    }
    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': "",
      "strMessageType": "voice",
      "strType": "group",
      "strUrl": fileUrl,
    });
  }

  static void sentGroupContactMessage(
      {required String chatId,
      required List numbers,
      required String name}) async {
    Socket socket = SocketService().socket;
    //convert message to base64

    socket.emit(
      'send_message',
      {
        'strChatId': chatId,
        'strMessage': "",
        "strMessageType": "contact",
        "strType": "group",
        "strUrl": "",
        "strContactNumbers": numbers[0].toString(),
        "strContactName": name
      },
    );
  }

  static Future<void> sentGroupDocumentMessage(
      {required String chatId, required String path}) async {
    final random = Random();
    Socket socket = SocketService().socket;
    UserController userController = Get.find();

    GroupChatController chatController = Get.find();
    int randomNumber = random.nextInt(1001);
    chatController.groupMessageList.add(GroupMessageModel(
        strIconURL: "",
        id: "$randomNumber",
        strCreatedTime: "",
        strMessage: basename(path),
        strMessageType: "sentingDoc",
        strName: "",
        strType: "group",
        strUrl: userController.userDetailsModel.value!.id,
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
      'strFileName': basename(path),
      "strMessageType": "document",
      "strType": "private",
      "strUrl": fileUrl,
    });
    // ChatMessageService.getMessages(chatId: chatId, type: "private");
    chatController.groupMessageList
        .removeWhere((element) => element.id == randomNumber.toString());
  }
}
