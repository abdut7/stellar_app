import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:stellar_chat/controllers/search_controllers.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/models/api_models/chat_search_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';

class ChatSearchService {
  static Future<void> getTextMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    ChatSearchController chatSearchController = Get.find();
    chatSearchController.isLoading(true);

    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strSearch": search,
      "strType": type,
      "strMessageType": "text"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);

    // print(res.data['arrList'].length());
    SearchResponse model = SearchResponse.fromJson(res.data);
    chatSearchController.messageChatList(model.arrList);
    chatSearchController.isLoading(false);
  }

  static Future<void> getMediaMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    ChatSearchController chatSearchController = Get.find();
    chatSearchController.isLoading(true);
    print("getting media message");
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strType": type,
      "strSearch": search,
      "strMessageType": "media"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    print(res);
    // print(res.data['arrList'].length());
    SearchResponse model = SearchResponse.fromJson(res.data);
    chatSearchController.mediaChatList(model.arrList);
    chatSearchController.isLoading(false);
  }

  static Future<void> getAudioMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    ChatSearchController chatSearchController = Get.find();
    chatSearchController.isLoading(true);

    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strSearch": search,
      "strType": type,
      "strMessageType": "audio"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    // print(res.data['arrList'].length());
    SearchResponse model = SearchResponse.fromJson(res.data);
    chatSearchController.audioChatList(model.arrList);
    chatSearchController.isLoading(false);
  }

  static Future<void> getDocumentMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    print("get document running");
    ChatSearchController chatSearchController = Get.find();
    chatSearchController.isLoading(true);

    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strSearch": search,
      "strType": type,
      "strMessageType": "document"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    // print(res.data['arrList'].length());
    SearchResponse model = SearchResponse.fromJson(res.data);
    chatSearchController.documentChatList(model.arrList);
    chatSearchController.isLoading(false);
  }
}
