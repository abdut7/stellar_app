import 'package:get/get.dart';

class SignupController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool isErrorOccured = RxBool(false);
  RxString errorMessage = RxString('');
  RxBool isSignupSuccess = RxBool(false);
}
