import 'package:google_fonts/google_fonts.dart';
import 'package:stellar_chat/View/Profile/settings/profile_settings/profile_settings.dart';
import 'package:stellar_chat/View/auth_screens/LoginWithMobile/LoginWithMobileUi.dart';
import 'package:stellar_chat/View/auth_screens/LoginWithMobile/login_with_mobile_screen.dart';
import 'package:stellar_chat/View/auth_screens/signup_with_mobile/sign_up_with_mobile_screen.dart';
import 'package:stellar_chat/View/chat/HomeChat/HomeChatUi.dart';
import 'package:stellar_chat/View/discover/discover_homescreen.dart';
import 'package:stellar_chat/View/splash/spalash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return  GetMaterialApp(
      theme: ThemeData(
      textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
