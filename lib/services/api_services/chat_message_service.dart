import 'package:logger/logger.dart';
import 'package:stellar_chat/controllers/private_chat_controller.dart';
import 'package:stellar_chat/models/private_chat/private_chat_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';
import '../socket_service/sent_join_room_event_socket.dart';

class ChatMessageService {
  static bool isBlocked = false;
  int pageCount = 0;
  static Future<void> getMessages({
    required String chatId,
    required String type,
    bool isFirstLoading = false,
  }) async {
    isBlocked = false;
    PrivateChatController chatController = Get.find();
    chatController.isLoadingFailed(false);
    chatController.isLoading(true);
    int pageNumber = chatController.pageNumber + 1;
    chatController.pageNumber = pageNumber;
    Logger().i(pageNumber);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "strChatId": chatId,
      "intPageCount": pageNumber
    };
    try {
      Response response =
          await dio.post(url, data: body, options: Options(headers: header));
      PrivateMessageJsonModel model =
          PrivateMessageJsonModel.fromJson(response.data);
      isBlocked = model.isBlocked;
      if (model.privateMessageModelList.isEmpty) {
        chatController.isEnded = true;
      }
      if (pageNumber == 1) {
        chatController.messageList.clear();
      }
      chatController.messageList.addAll(model.privateMessageModelList);
      sentRoomJoinSocket(chatId: chatId, type: type);
    } catch (e) {
      chatController.isLoadingFailed(true);
    } finally {
      chatController.isLoading(false);
    }
  }

  static Future<void> clearAllMessages({required String chatId}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.clearPersonalChat;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"strChatId": chatId};
    print("Call working good");
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: body);
      print(res);
    } catch (e) {
      print(e);
    }
    ChatMessageService.getMessages(chatId: chatId, type: "private");
  }
}
