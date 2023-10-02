import 'package:stellar_chat/functions/get_header.dart';
import 'package:stellar_chat/models/api_models/user_details_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';

class PublicProfileService {
  Future<UserDetailsModel?> getPublicProfileData({required String uid}) async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getUserById;
    Map<String, dynamic> header = await getHeader();
    Map<String, String> body = {"strUserId": uid};
    print(uid);
    try {
      Response res =
          await dio.post(path, options: Options(headers: header), data: body);
      print(res);
      UserDetailsModel model = UserDetailsModel.fromJson(res.data);
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
