import 'package:dio/dio.dart';

import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';

Future<String?> uploadFiles({required String base64File}) async {
  Dio dio = Dio();
  String path = ApiRoutes.baseUrl + ApiRoutes.uploadBase64;
  Map<String, dynamic> header = await getHeader();
  Map<String, dynamic> body = {"strFileBase64": base64File};
  try {
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    if (res.statusCode == 200) {
      return res.data["strUrl"];
    }
    return null;
  } catch (e) {
    return null;
  }
}
