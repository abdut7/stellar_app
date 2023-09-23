import 'package:dio/dio.dart';

import '../../functions/get_header.dart';
import '../../models/api_models/user_details_model.dart';
import '../api_routes/api_routes.dart';

class GetUserDetailsService {
  static Future<UserDetailsModel?> getUserDetails() async {
    Dio dio = Dio();
    String path = ApiRoutes.baseUrl + ApiRoutes.getUserById;
    Map<String, dynamic> header = await getHeader();
    try {
      Response res = await dio.post(path, options: Options(headers: header));
      UserDetailsModel model = UserDetailsModel.fromJson(res.data);
      return model;
    } catch (e) {
      return null;
    }
  }
}
