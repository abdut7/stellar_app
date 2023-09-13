import 'package:base_project/View/Chat/HomeChat/HomeChatUi.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../View/Chat/CreateNewChat/CreateNewChatUi.dart';
import '../../View/LoginPages/WelcomePage/WelcomePageUi.dart';

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
    Get.off(() => const WelcomePageUi());
  } else {
    Get.off(() => HomeChatUi());
  }
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