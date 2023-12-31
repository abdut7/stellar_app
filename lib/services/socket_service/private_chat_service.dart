import 'dart:math';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:stellar_chat/controllers/contacts_controller.dart';
import 'package:stellar_chat/controllers/private_chat_controller.dart';
import 'package:stellar_chat/functions/get_location_name.dart';
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

  static void sentPersonalStickerMessage(String chatId, String message) {
    print(chatId);
    print(message);
    Socket socket = SocketService().socket;

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': message,
      "strMessageType": "sticker",
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
        strContactId: "",
        id: "",
        strLatitude: 0.0,
        strLongitude: 0.0,
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

  static Future<void> sentPersonalAudioMessage(
      {required String chatId, required String path}) async {
    Socket socket = SocketService().socket;

    String? fileUrl = await UploadFileService.uploadFile(filePaths: [path]);

    if (fileUrl == null) {
      return;
    }
    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': "",
      "strMessageType": "audio",
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
        strContactId: "",
        strLatitude: 0.0,
        strLongitude: 0.0,
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
      'strFileName': basename(path),
      "strMessageType": "document",
      "strType": "private",
      "strUrl": fileUrl,
    });
    // ChatMessageService.getMessages(chatId: chatId, type: "private");
    chatController.messageList
        .removeWhere((element) => element.id == randomNumber.toString());
  }

  static Future<void> sentPersonalLocationMessage({
    required String chatId,
    required double longitude,
    required double latitude,
  }) async {
    final random = Random();
    Socket socket = SocketService().socket;
    String locationName = await getLocationName(longitude, latitude);

    PrivateChatController chatController = Get.find();
    int randomNumber = random.nextInt(1001);
    chatController.messageList.add(PrivateMessageModel(
        strContactId: "",
        strLatitude: 0.0,
        strLongitude: 0.0,
        id: "$randomNumber",
        strCreatedTime: "",
        strMessage: locationName,
        strMessageType: "sentingLoc",
        strName: "",
        strType: "",
        strUrl: "",
        strUserId: "",
        strContactName: "",
        strContactNumbers: "",
        strChatId: ""));

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': locationName,
      "strMessageType": "location",
      "strType": "private",
      "strLongitude": longitude,
      "strLatitude": latitude
    });
    // ChatMessageService.getMessages(chatId: chatId, type: "private");
    chatController.messageList
        .removeWhere((element) => element.id == randomNumber.toString());
  }
}
