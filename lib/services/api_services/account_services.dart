import 'package:base_project/functions/get_header.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
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
    Map<String, String> body = {"strFollowingUserId": id};
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

  static Future<bool> getBlockedUserList() async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getBlockedUserList;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(
        path,
        options: Options(headers: header),
      );
      print(res);

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
