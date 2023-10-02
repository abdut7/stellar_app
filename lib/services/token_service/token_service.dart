import 'package:stellar_chat/View/base_bottom_nav/bottom_nav.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/models/api_models/user_details_model.dart';
import 'package:stellar_chat/services/api_routes/api_routes.dart';
import 'package:stellar_chat/services/api_services/user_details_service.dart';
import 'package:stellar_chat/utils/uid.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../View/auth_screens/auth_home_page/auth_home_screen.dart';
import '../socket_service/socket_service.dart';

Future<void> storeJwtToken(String jwtToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwt_token', jwtToken);
}

Future<String?> getJwtToken() async {
  final prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  return prefs.getString('jwt_token');
}

Future<void> logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  Get.offAll(() => const AuthHomeScreen());
}

Future<void> authenticateUser() async {
  UserController userController = Get.put(UserController());
  String? token = await getJwtToken();
  if (token == null) {
    Get.off(() => const AuthHomeScreen());
  } else {
    UserDetailsModel? userDetailsModel =
        await GetUserDetailsService.getUserDetails();
    if (userDetailsModel == null) {
      Get.off(() => const AuthHomeScreen());
      return;
    }
    userController.userDetailsModel(userDetailsModel);
    final socketService = SocketService();
    socketService.initializeSocket(
      ApiRoutes.socketBaseUrl,
      token,
    );
    Get.off(() => const BaseBottomNavigation());
  }
}

Future<void> getUserDetailsonRefresh() async {
  UserController userController = Get.put(UserController());
  UserDetailsModel? userDetailsModel =
      await GetUserDetailsService.getUserDetails();
  userController.userDetailsModel(userDetailsModel);
}

Future<void> storeUid(String uid) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('uid', uid);
}

Future<String?> getUid() async {
  final prefs = await SharedPreferences.getInstance();
  String? val = prefs.getString('uid');
  if (val != null) {
    globalUid = val;
  }
  return val;
}


/*
USAGE
 Storing the JWT token
final jwtToken = 'your_jwt_token_here'; // Replace with your actual JWT token
await storeJwtToken(jwtToken);

 Retrieving the JWT token
final storedToken = await getJwtToken();
print('JWT Token: $storedToken');
 */