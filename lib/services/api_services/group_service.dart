import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';

class GroupServices {
  static Future<bool> createGroup(
      List<String> userIdList, String groupName, XFile? groupFile) async {
    String url = ApiRoutes.baseUrl + ApiRoutes.createGroup;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "arrUserIds": userIdList,
      "strGroupName": groupName,
      "strDiscription": "This is my group 2"
    };
    Dio dio = Dio();
    try {
      Response res =
          await dio.post(url, data: body, options: Options(headers: header));
      print(res);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
