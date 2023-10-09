import 'package:stellar_chat/functions/delete_audio_file.dart';
import 'package:stellar_chat/functions/image_to_base.dart';
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
    //convert message to base64
    String audioAsBase = await filePathToBase(path);
    clearFile(path);
    //upload and take link
    String? fileUrl =
        await uploadFiles(fileExtension: 'aac', base64File: audioAsBase);
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
}
