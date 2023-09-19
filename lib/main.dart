import 'package:base_project/View/LoginPages/OtpVerification/otp_verification_screen.dart';
import 'package:base_project/View/LoginPages/SignUpWithMobile/sign_up_with_mobile_screen.dart';
import 'package:base_project/View/help/help_article_screen.dart';
import 'package:base_project/View/splash/spalash_screen.dart';
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
    return  const GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
