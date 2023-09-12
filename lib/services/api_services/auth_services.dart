import 'package:base_project/controllers/api_controllers/signup_controllers.dart';
import 'package:base_project/models/api_models/signup_model.dart';
import 'package:base_project/providers/auth_providers/sign_up_provider.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../../View/LoginPages/OtpVerification/OtpVerificationUi.dart';

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

    String path = ApiRoutes.baseUrl + ApiRoutes.createUser;
    try {
      Response response = await dio.post(path, data: body);
      if (response.statusCode == 200) {
        signupController.isSignupSuccess(true);
        Get.to(() => const OtpVerificationUi());
      } else {
        signupController.isSignupSuccess(false);
      }
      signupController.isLoading(false);
      Get.snackbar(
        'Error Signin',
        "Please retry",
        duration: Duration(seconds: 3), // Snackbar duration
        isDismissible:
            true, // Whether the Snackbar can be dismissed by tapping outside
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error Signin',
        "Please retry",
        duration: Duration(seconds: 3), // Snackbar duration
        isDismissible:
            true, // Whether the Snackbar can be dismissed by tapping outside
      );
      signupController.isLoading(false);
      signupController.isSignupSuccess(false);
      signupController.isErrorOccured(true);
    }
  }
}
