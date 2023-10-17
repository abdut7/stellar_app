import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:stellar_chat/View/base_bottom_nav/bottom_nav.dart';
import 'package:stellar_chat/controllers/bottom_navigation_controller.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';
import 'package:stellar_chat/controllers/new_post/new_post_common_controller.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/models/api_models/comment_model.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:stellar_chat/services/api_services/upload_file_service.dart';

class FliqServices {
  static Future<void> searchUserInTag({required String search}) async {
    NewPostController controller = Get.find();
    if (search.isEmpty) {
      controller.isSearching(false);
      controller.searchList.clear();
      return;
    }
    controller.isSearching(true);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getStellarContacts;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> data = {"strSearch": search};
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      GetContactsModel model = GetContactsModel.fromJson(res.data);
      List<Contact> userList = [];
      for (var element in model.arrList) {
        userList.add(element);
      }
      controller.searchList(userList);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> searchLocation({required String search}) async {
    NewPostController controller = Get.find();
    if (search.isEmpty) {
      controller.isSearching(false);
      controller.searchList.clear();
      return;
    }
    controller.isSearching(true);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getStellarContacts;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> data = {"strSearch": search};
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      GetContactsModel model = GetContactsModel.fromJson(res.data);
      List<Contact> userList = [];
      for (var element in model.arrList) {
        userList.add(element);
      }
      controller.locationName("userList");
    } catch (e) {}
  }

  //upload the fliq

  static Future<void> uploadFliq(
      {required bool isCommentEnabled,
      required bool isLikeAndViews,
      required String path,
      required String strDescription,
      required List<String> arrUserIds,
      required String strLocation}) async {
    NewPostController controller = Get.find();
    controller.isUploading(true);
    BottomNavigationController bottomNavigationController = Get.find();
    bottomNavigationController.pageCount(4);
    Get.offAll(() => const BaseBottomNavigation());
    // upload file here
    String? strFileUrl = await UploadFileService.uploadFile(
        filePaths: [path], isFromFlicks: true);
    //
    if (controller.isCancelled.value) {
      controller.isUploading(false);
      controller.isCancelled(false);
    }

    // await Future.delayed(const Duration(seconds: 5));
    //
    controller.isUploading(false);
    controller.isPosting(true);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.postFlick;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "isCommentEnabled": isCommentEnabled,
      "strType": "flick",
      "isLikeAndViews": isLikeAndViews,
      "strFileUrl": strFileUrl,
      "strDescription": strDescription,
      "arrUserIds": arrUserIds,
      "strLocation": strLocation
    };
    print(data);
    Response res =
        await dio.post(url, options: Options(headers: header), data: data);
    print(res);
    controller.isPosting(false);
    controller.uploadPercentage(0);
    controller.isUploaded(true);
    bottomNavigationController.pageCount(4);
    Get.offAll(() => const BaseBottomNavigation());
    await Future.delayed(Duration(seconds: 5));
    controller.isUploaded(false);
  }

  Future<void> getFlicksById({required String id, required int count}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFlicksById;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strUserId": id,
      "intPageCount ": count.toString()
    };
    ProfileFlicksController controller = Get.find();
    print(count);
    if (count == 1) {
      controller.flickItems.clear();
    }

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      FlickModel model = FlickModel.fromJson(res.data);
      for (var element in model.arrList) {
        controller.flickItems.add(element);
      }
      // return model.arrList;
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> getFlick({required int count}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFlicksList;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"intPageCount ": count.toString()};
    FlicksPlayerController controller = Get.find();

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      FlickModel model = FlickModel.fromJson(res.data);
      print(model.arrList.length);
      for (var element in model.arrList) {
        controller.flickItems.add(element);
      }
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> likeFlick({required String flickId}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.likeFlick;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"strFlickId": flickId, "strType": "flick"};

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> unLikeFlick({required String flickId}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.unlikeFlick;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"strFlickId": flickId, "strType": "flick"};

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> unLikeFlickComment(
      {required String flickId, required String commentId}) async {
    print("Comment unliking ");

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.unlikeFlickComment;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strCommentId": commentId,
      "strFlickId": flickId,
      "strType": "flick"
    };

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> likeFlickComment(
      {required String flickId, required String commentId}) async {
    print("Comment liking ");
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.likeFlickComment;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strCommentId": "65213e99d8e8c7d817a8dfbc",
      "strFlickId": "65211feff649fbeccd2d154a",
      "strType": "flick"
    };

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<CommentResponseModel?> getComments({required String id}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFlickComments;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"strFlickId": id};

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      CommentResponseModel model = CommentResponseModel.fromJson(res.data);
      return model;
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> addComments(
      {required String flickId, required String comment}) async {
    print(comment);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.addFlickComments;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strComment": comment,
      "strFlickId": flickId,
      "strType": "flick"
    };

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  static Future<void> addView({required String flickId}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.createView;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"strFlickId": flickId, "strType": "flick"};
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
    } on Exception catch (e) {
      // TODO
    }
  }
}
