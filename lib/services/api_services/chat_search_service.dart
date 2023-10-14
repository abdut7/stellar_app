import 'package:dio/dio.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';

class ChatSearchService {
  
  static Future<void> getTextMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strSearch": search,
      "strType": type,
      "strSearchType": "media"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    // print(res.data['arrList'].length());
    print(res);
  }

  static Future<void> getMediaMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strType": type,
      "strSearch": search,
      "strSearchType": "media"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    // print(res.data['arrList'].length());
    print(res);
  }

  static Future<void> getAudioMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strSearch": search,
      "strType": type,
      "strSearchType": "audio"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    // print(res.data['arrList'].length());
    print(res);
  }

  static Future<void> getDocumentMessages({
    required String search,
    required String chatId,
    required String type,
  }) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getPrivateMessage;
    Map<String, dynamic> header = await getHeader();

    Map<String, dynamic> body = {
      "strChatId": chatId,
      "strSearch": search,
      "strType": type,
      "strSearchType": "document"
    };
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    // print(res.data['arrList'].length());
    print(res);
  }
}
