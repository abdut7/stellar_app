import 'package:dio/dio.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/models/api_models/follow_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';

class FollowingServices {
  Future<FollowModel?> getFollowerList() async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFollowersList;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(url, options: Options(headers: header));
      return FollowModel.fromJson(res.data);
    } catch (e) {}
  }

  Future<FollowModel?> getFollowingList() async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFollowingList;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(url, options: Options(headers: header));
      return FollowModel.fromJson(res.data);
    } catch (e) {}
  }
}
