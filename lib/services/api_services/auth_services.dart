import 'package:base_project/models/api_models/signup_model.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<void> signupUser(SignupModel signupModel) async {
    Dio dio = Dio();
    Map<String, dynamic> body = signupModel.toMap();
    String path = ApiRoutes.baseUrl + ApiRoutes.createUser;
    try {
      Response response = await dio.post(path, data: body);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
