import 'package:base_project/models/api_models/chat_history_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../controllers/api_controllers/chat_history_controller.dart';
import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';
import '../socket_service/chat_history_socket_service.dart';

class ChatHistoryServiceApi {
  static Future<void> getChatHistory() async {
    ChatHistoryController chatHistoryController = Get.put(
      ChatHistoryController(),
    );
    chatHistoryController.isLoading(true);
    chatHistoryController.errorOccured(false);
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getChatHistory;
    Map<String, dynamic> header = await getHeader();

    try {
      Response response =
          await dio.post(path, options: Options(headers: header));
      print(response);
      ChatHistoryModel model = ChatHistoryModel.fromJson(response.data);
      chatHistoryController.chatHistoryList(model.chatHistoryList);
    } catch (e) {
      print(e);
      chatHistoryController.errorOccured(true);
    } finally {
      ChatHistorySocketService.chatHistorySocketService();
      chatHistoryController.isLoading(false);
    }
  }
}
