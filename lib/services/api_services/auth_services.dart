import 'package:base_project/controllers/api_controllers/login_with_phone_controller.dart';
import 'package:base_project/controllers/api_controllers/signup_controllers.dart';
import 'package:base_project/functions/show_snackbar.dart';
import 'package:base_project/models/api_models/login_success_model.dart';
import 'package:base_project/models/api_models/signup_model.dart';
import 'package:base_project/services/api_routes/api_routes.dart';
import 'package:base_project/services/token_service/token_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../View/auth_screens/OtpVerification/otp_verification_screen.dart';

class AuthServices {
  //user signup
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

        String strOtpToken = response.data['strOTPToken'];
        Get.to(
          () => OtpVerificationUi(otpToken: strOtpToken),
        );
      } else {
        signupController.isSignupSuccess(false);
      }
      signupController.isLoading(false);
      Get.snackbar(
        'Error Signin',
        "Please retry",
        duration: const Duration(seconds: 3), // Snackbar duration
        isDismissible:
            true, // Whether the Snackbar can be dismissed by tapping outside
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error Signin',
        "Please retry",
        duration: const Duration(seconds: 3), // Snackbar duration
        isDismissible:
            true, // Whether the Snackbar can be dismissed by tapping outside
      );
      signupController.isLoading(false);
      signupController.isSignupSuccess(false);
      signupController.isErrorOccured(true);
    }
  }

  //login using phone number
  Future<void> loginService(String phoneNumber) async {
    LoginWithPhoneNumberConteroller login = Get.find();
    login.isLoading(true);
    Dio dio = Dio();
    Map<String, dynamic> body = {"strMobileNo": phoneNumber};
    String path = ApiRoutes.baseUrl + ApiRoutes.phoneNumberLogin;

    try {
      Response res = await dio.post(path, data: body);
      print(res);
      if (res.statusCode == 200) {
        print(res.data);
        // LoginSuccessModel model = LoginSuccessModel.fromJson(res.data);
        // login.loginModel(model);
        // storeJwtToken(model.strToken);
        // storeUid(model.id);

        String strOtpToken = res.data['strOTPToken'];
        Get.to(
          () => OtpVerificationUi(otpToken: strOtpToken),
        );
      }
      login.isLoading(false);
    } catch (e) {
      print(e);
      showCustomSnackbar(title: "Error", message: "Invalid Phone Number");
      login.isLoading(false);
    }
  }

  static Future<void> otpVerificationService(
      {required String otp, required String otpToken}) async {
    LoginWithPhoneNumberConteroller login = Get.find();

    Dio dio = Dio();
    Map<String, dynamic> body = {"strOTPToken": otpToken, "strOTP": otp};
    String path = ApiRoutes.baseUrl + ApiRoutes.verifyOtp;
    try {
      Response res = await dio.post(path, data: body);
      if (res.statusCode == 200) {
        LoginSuccessModel model = LoginSuccessModel.fromJson(res.data);
        login.loginModel(model);
        storeJwtToken(model.strToken);
        storeUid(model.id);
        authenticateUser();
      } else {
        showCustomSnackbar(title: "Error", message: "Invalid OTP");
      }
    } catch (e) {
      showCustomSnackbar(title: "Error", message: "Invalid OTP");
    }
  }
}
