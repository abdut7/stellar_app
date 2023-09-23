import 'package:get/get.dart';

import '../models/api_models/user_details_model.dart';

class UserController extends GetxController {
  Rx<UserDetailsModel?> userDetailsModel = Rx(null);
}

UserController controller = Get.find();
