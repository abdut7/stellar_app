import 'package:base_project/controllers/private_chat_controller.dart';
import 'package:base_project/models/private_chat/private_chat_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';
import '../socket_service/sent_join_room_event_socket.dart';

class ChatMessageService {
  static Future<void> getMessages(
      {required String chatId, required String type}) async {
    PrivateChatController chatController = Get.put(PrivateChatController());
    chatController.isLoadingFailed(false);
    chatController.isLoading(true);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"strChatId": chatId};
    try {
      Response response =
          await dio.post(url, data: body, options: Options(headers: header));
      PrivateMessageJsonModel model =
          PrivateMessageJsonModel.fromJson(response.data);
      chatController.messageList.clear();
      chatController.messageList.addAll(model.privateMessageModelList);
      sentRoomJoinSocket(chatId: chatId, type: type);
    } catch (e) {
      chatController.isLoadingFailed(true);
    } finally {
      chatController.isLoading(false);
    }
  }
}
