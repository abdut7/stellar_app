import 'package:logger/logger.dart';
import 'package:stellar_chat/controllers/contacts_controller.dart';
import 'package:stellar_chat/controllers/group_chat_controller.dart';
import 'package:stellar_chat/functions/image_to_base.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';
import 'package:stellar_chat/models/group_chat/group_message_model.dart';
import 'package:stellar_chat/services/socket_service/sent_join_room_event_socket.dart';
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
      baseImage = await filePathToBase(groupFile.path);
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
      GroupDetailsResponseModel model =
          GroupDetailsResponseModel.fromJson(response.data);
      print(model.isAdmin);
      return model;
    } on Exception {
      // TODO
      return null;
    }
  }

  // get Group Messages

  static Future<void> getGroupMessage(
      {required String groupId, bool isFirstLoading = true}) async {
    GroupChatController chatController = Get.put(GroupChatController());
    chatController.isErrorOccured(false);

    if (chatController.pageNumber == 0) {
      chatController.isLoading(true);
    }
    int pageNumber = chatController.pageNumber + 1;
    chatController.pageNumber = pageNumber;
    Logger().i(pageNumber);
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getGroupMessage;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "strChatId": groupId,
      "strType": "group",
      "page": pageNumber
    };
    print(body);
    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      print(res);
      GroupMessageResponseModel model =
          GroupMessageResponseModel.fromJson(res.data);
      if (model.groupMessageModel.isEmpty) {
        chatController.isEnded = true;
      }
      if (pageNumber == 1) {
        chatController.groupMessageList.clear();
      }
      chatController.groupMessageList.addAll(model.groupMessageModel);
      sentRoomJoinSocket(chatId: groupId, type: 'group');
    } catch (e) {
      print(e);
      chatController.isErrorOccured(true);
    } finally {
      chatController.isLoading(false);
    }
  }

  static Future<bool> exitGroup(String id) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.exitGroup;
    print(path);
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "_id": id,
    };
    try {
      Response response =
          await dio.post(path, options: Options(headers: header), data: body);
      return true;
    } on Exception catch (e) {
      // TODO
      return false;
    }
  }

  static Future<bool> removeUser(
      {required String uid, required String chatID}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.removeUserFromGroup;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"_id": chatID, "strUserId": uid};
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addParticipents(
      {required List<String> uid, required String chatID}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.updateGroup;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"_id": chatID, "arrUserIds": uid};
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateDescription(
      {required String description, required String chatID}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.updateGroup;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"_id": chatID, "strDiscription": description};

    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      print(res);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateName(
      {required String name, required String chatID}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.updateGroup;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"_id": chatID, "strGroupName": name};

    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      print(res);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateImage(
      {required String icon, required String chatID}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.updateGroup;
    icon = await filePathToBase(icon);
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"_id": chatID, "strIconeBase64": icon};

    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      print(res);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> makeGroupAdmin(
      {required String uid,
      required String chatID,
      required bool makeAdmin}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.makeAdmin;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {
      "isAdmin": makeAdmin,
      "strUserId": uid,
      "strGroupId": chatID
    };
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> getAddParticipentsContacts(
      {required String groupId}) async {
    ContactsController contactsController = Get.put(ContactsController());
    contactsController.isGetContactErrorOccured(false);
    contactsController.isGetContactLoading(true);
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.addParticipentsContacts;

    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> body = {"_id": groupId};
    Response res =
        await dio.post(path, options: Options(headers: header), data: body);
    GetContactsModel model = GetContactsModel.fromJson(res.data);
    List<Contact> userList = [];
    for (var element in model.arrList) {
      userList.add(element);
    }
    contactsController.phoneNumberUserList.clear();
    contactsController.phoneNumberUserList.addAll(userList);
    contactsController.isGetContactLoading(false);
  }
}
