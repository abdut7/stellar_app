import 'package:image_picker/image_picker.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/functions/image_to_base.dart';
import 'package:stellar_chat/models/api_models/blocked_user_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class AccountServices {
  //follow user
  static Future<bool> followUser(String id) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.followUser;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> body = {"strFollowingUserId": id};
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // unfollow user
  static Future<bool> unFollowUser(String id) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.unFollowUser;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> body = {"strFollowingUserId": id};
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  //block user
  static Future<bool> blockUser(String id) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.blockUser;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> body = {"strFollowingUserId": id};
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      Get.snackbar(
        'Blocked',
        'User Blocked successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.blue,
        borderRadius: 10,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 500),
      );
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  // unblock user
  static Future<bool> unBlockUser(String id) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.unBlockUser;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> body = {"strUserId": id};
    try {
      await dio.post(path, options: Options(headers: header), data: body);
      Get.snackbar(
        'UnBlocked',
        'User UnBlocked successfully',
        snackPosition: SnackPosition.TOP, // Optional: Specify the position
        backgroundColor:
            Colors.blue, // Optional: Customize the background color
        borderRadius: 10, // Optional: Customize the border radius
        duration: const Duration(seconds: 3), // Optional: Specify the duration
        animationDuration:
            const Duration(milliseconds: 500), // Optional: Animation duration
      );
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
  //get blocked user list

  static Future<List<BlockedUsers>?> getBlockedUserList() async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getBlockedUserList;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(
        path,
        options: Options(headers: header),
      );
      BlockedUsersResponseModel model =
          BlockedUsersResponseModel.fromJson(res.data);
      return model.blockedUsers;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> updateUserProfile(
      {required String name,
      required String username,
      required String uid,
      required String aboutMe,
      XFile? image}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.updateUser;
    Map<String, dynamic> data;

    if (image == null) {
      data = {
        "strName": name,
        "strFullName": username,
        "_id": uid,
        "strAbout": aboutMe
      };
    } else {
      String img = await filePathToBase(image.path);
      data = {
        "strName": username,
        "strFullName": name,
        "_id": uid,
        "strAbout": aboutMe,
        "strProfileBase64": img
      };
    }

    Map<String, dynamic> header = await getHeader();
    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: data);
      print(res);
      return true;
    } catch (e) {
      return false;
    }
  }
}
