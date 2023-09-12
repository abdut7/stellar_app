import 'package:base_project/controllers/api_controllers/signup_controllers.dart';
import 'package:base_project/models/api_models/signup_model.dart';
import 'package:base_project/providers/auth_providers/sign_up_provider.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class AuthServices {
  Future<void> signupUser(SignupModel signupModel) async {
    SignupController signupController = Get.find();
    signupController.isLoading(true);
    signupController.isErrorOccured(false);
    signupController.isSignupSuccess(false);
    signupController.errorMessage('');
    Dio dio = Dio();
    Map<String, dynamic> body = {
      "strProfileBase64": signupModel.filePath,
      "strName": signupModel.username,
      "strFullName": signupModel.fullName,
      "strMobileNo": signupModel.phoneNumber,
      "strEmail": signupModel.email,
      "strType": "USER",
      "strPassword": signupModel.password,
      "strSignupMethode": "OTP",
      "coordinates": signupModel.coordinates,
      "strRegion": signupModel.region
    };
    print(body);
    String path = ApiRoutes.baseUrl + ApiRoutes.createUser;
    try {
      await Future.delayed(Duration(seconds: 5));
      Response response = await dio.post(path, data: body);
      print(response);
      if (response.statusCode == 200) {
        signupController.isSignupSuccess(true);
      } else {
        signupController.isSignupSuccess(false);
      }
      signupController.isLoading(false);
    } catch (e) {
      print(e);
      signupController.isLoading(false);
      signupController.isSignupSuccess(false);
      signupController.isErrorOccured(true);
    }
  }
}
