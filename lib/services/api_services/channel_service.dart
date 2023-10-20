import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:stellar_chat/View/base_bottom_nav/bottom_nav.dart';
import 'package:stellar_chat/controllers/bottom_navigation_controller.dart';
import 'package:stellar_chat/controllers/channel/channel_controller.dart';
import 'package:stellar_chat/controllers/flicks/flicks_player_controller.dart';
import 'package:stellar_chat/controllers/new_post/new_post_common_controller.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/functions/get_video_duration.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
import 'package:stellar_chat/models/api_models/comment_model.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';
import 'package:stellar_chat/models/api_models/get_contacts_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:stellar_chat/services/api_services/upload_file_service.dart';

class ChannelService {
  //upload the fliq

  static Future<void> uploadChannel(
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
    String duration = await getVideoDuration(path);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.postChannel;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strDuration": duration,
      "isCommentEnabled": isCommentEnabled,
      "strType": "channel",
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

  Future<void> getChannelsById({required String id, required int count}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getChannelById;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strUserId": id,
      "intPageCount ": count.toString()
    };
    ProfileChannelController controller = Get.find();
    print(count);
    if (count == 1) {
      controller.channelItem.clear();
    }

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      ChannelModel model = ChannelModel.fromJson(res.data);
      for (var element in model.arrList) {
        controller.channelItem.add(element);
      }
      // return model.arrList;
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<void> getChannel({required int count}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getChannelList;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"intPageCount ": count.toString()};
    ChannelHomeController controller = Get.find();
    if (count == 1) {
      controller.channelItems.clear();
    }

    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print("channel data:$res");
      ChannelModel model = ChannelModel.fromJson(res.data);
      print(model.arrList.length);
      for (var element in model.arrList) {
        controller.channelItems.add(element);
      }
    } on Exception catch (e) {
      return null;
      // TODO
      print(e);
    }
  }

  Future<List<ChannelItem>> getFavoriteChannel() async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFavoriteChannel;
    Map<String, dynamic> header = await getHeader();
    List<ChannelItem> channelItemList = [];

    Response res = await dio.post(url, options: Options(headers: header));
    ChannelModel model = ChannelModel.fromJson(res.data);
    print("model is: $model");
    for (var element in model.arrList) {
      channelItemList.add(element);
    }
    print("channel: $channelItemList");
    return channelItemList;
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

  Future<void> unLikeChannelComment(
      {required String channelId, required String commentId}) async {
    print("Comment unliking ");

    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.unlikeFlickComment;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strCommentId": commentId,
      "strChannelId": channelId,
      "strType": "channel"
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

  Future<void> likeChannelComment(
      {required String channelId, required String commentId}) async {
    print("Comment liking ");
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.likeFlickComment;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strCommentId": commentId,
      "strChannelId": channelId,
      "strType": "channel"
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
    String url = ApiRoutes.baseUrl + ApiRoutes.getChannelComments;
    print(url);
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {"strChannelId": id};
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
      print(res);
      CommentResponseModel model = CommentResponseModel.fromJson(res.data);
      return model;
    } on Exception catch (e) {
      print(e);
      return null;
      // TODO
    }
  }

  Future<void> addComments(
      {required String channelId, required String comment}) async {
    print(comment);
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.addFlickComments;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strComment": comment,
      "strChannelId": channelId,
      "strType": "channel"
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

  static Future<void> addView({required String channelId}) async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.createView;
    Map<String, dynamic> header = await getHeader();
    Map<String, dynamic> data = {
      "strChannelId": channelId,
      "strType": "channel"
    };
    try {
      Response res =
          await dio.post(url, options: Options(headers: header), data: data);
    } on Exception catch (e) {
      // TODO
    }
  }
}
