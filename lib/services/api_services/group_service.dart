import 'package:base_project/functions/image_to_base.dart';
import 'package:base_project/functions/show_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../functions/get_header.dart';
import '../api_routes/api_routes.dart';

class GroupServices {
  static Future<bool> createGroup(
      List<String> userIdList, String groupName, XFile? groupFile) async {
    String baseImage = "";
    if (groupFile != null) {
      baseImage = await imageToBase(groupFile.path);
    }

    String url = ApiRoutes.baseUrl + ApiRoutes.createGroup;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "arrUserIds": userIdList,
      "strGroupName": groupName,
      "strDiscription": "This is my group 2",
      "strIconeBase64": baseImage
    };
    Dio dio = Dio();
    try {
      Response res =
          await dio.post(url, data: body, options: Options(headers: header));
      print(res);
      if (res.statusCode == 200) {
        showCustomSnackbar(
            title: "Group Creation Succesfull",
            message: "Group $groupName created succesfully");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
