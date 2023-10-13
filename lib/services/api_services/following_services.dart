import 'package:dio/dio.dart';
import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';

class FollowingServices {
  Future<void> getFollowerList() async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFollowersList;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(url, options: Options(headers: header));
      print(res);
    } catch (e) {}
  }

  Future<void> getFollowingList() async {
    Dio dio = Dio();
    String url = ApiRoutes.baseUrl + ApiRoutes.getFollowingList;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(url, options: Options(headers: header));
      print(res);
    } catch (e) {}
  }
}
