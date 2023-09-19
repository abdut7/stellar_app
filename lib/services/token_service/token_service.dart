import 'package:base_project/View/base_bottom_nav/bottom_nav.dart';
import 'package:base_project/utils/uid.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../View/LoginPages/auth_home_page/auth_home_screen.dart';
import '../socket_service/socket_service.dart';

Future<void> storeJwtToken(String jwtToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwt_token', jwtToken);
}

Future<String?> getJwtToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('jwt_token');
}

Future<void> authenticateUser() async {
  String? token = await getJwtToken();
  if (token == null) {
    Get.off(() => const AuthHomeScreen());
  } else {
    final socketService = SocketService();
    socketService.initializeSocket(
      'https://8536-2409-40f4-6-a1b1-d9fd-2e9f-1dcf-f95e.ngrok-free.app/',
      token,
    );
    Get.off(() => const BaseBottomNavigation());
  }
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