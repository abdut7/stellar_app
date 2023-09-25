import 'package:base_project/controllers/group_chat_controller.dart';
import 'package:base_project/functions/image_to_base.dart';
import 'package:base_project/functions/show_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';

import '../../functions/get_header.dart';
import '../../models/group_chat/group_details_model.dart';
import '../api_routes/api_routes.dart';

class GroupServices {
  // create group
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

  //get group info
  static Future<GroupDetailsResponseModel?> getGroupDetails(
      {required String groupId}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getGroupDetails;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"strGroupId": groupId};
    try {
      Response response =
          await dio.post(path, options: Options(headers: header), data: body);
      print(response);
      GroupDetailsResponseModel model =
          GroupDetailsResponseModel.fromJson(response.data);
      return model;
    } on Exception {
      // TODO
      return null;
    }
  }

  // get Group Messages

  static Future<void> getGroupMessage({required String groupId}) async {
    GroupChatController chatController = Get.put(GroupChatController());
    chatController.isErrorOccured(false);
    chatController.groupMessageList.clear();
    chatController.isLoading(true);
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getGroupMessage;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"strGroupId": groupId};
    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      print(res);
    } catch (e) {
      print("error");
      print(e);
    }
  }
}
