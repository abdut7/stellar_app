import 'package:stellar_chat/models/api_models/login_success_model.dart';
import 'package:get/get.dart';

class LoginWithPhoneNumberConteroller extends GetxController {
  RxBool isLoading = RxBool(false);
  Rx<LoginSuccessModel?> loginModel = Rx(null);
}
