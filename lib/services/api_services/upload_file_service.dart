import 'package:dio/dio.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';

class UploadFileService {
  static Future<String?> uploadFile(String path) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getStellarContacts;
    Map<String, dynamic> header = await getHeader();
    // Map<String, String> data = {"strSearch": query};
    Response res = await dio.post(
      path,
      options: Options(headers: header),
    );
  }
}
