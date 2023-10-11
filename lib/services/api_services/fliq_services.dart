import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:stellar_chat/View/base_bottom_nav/bottom_nav.dart';
import 'package:stellar_chat/controllers/new_post/fliq_controller.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:stellar_chat/services/api_services/upload_file_service.dart';

class FliqServices {
  static Future<void> searchUserInTag({required String search}) async {
    FliqController controller = Get.find();
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
    FliqController controller = Get.find();
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
    FliqController controller = Get.find();
    controller.isUploading(true);
    // String? strFileUrl = await UploadFileService.uploadFile(path);
   //
    String? strFileUrl = "hello";
    await Future.delayed(Duration(seconds: 5));
    //
    controller.isUploading(false);
    controller.isPosting(true);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getStellarContacts;
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
    await Future.delayed(Duration(seconds: 5));
    // Response res =
    //     await dio.post(url, options: Options(headers: header), data: data);
    controller.isPosting(false);
    Get.offAll(BaseBottomNavigation());
  }
}
