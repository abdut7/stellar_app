import 'dart:io';

import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellar_chat/View/auth_screens/LoginWithMobile/login_with_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_chat/View/create_post/create_post_home.dart';
import 'package:stellar_chat/View/splash/spalash_screen.dart';
import 'package:stellar_chat/View/video_editor/video_editor_screen.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final isDarkTheme = sharedPreferences.getBool('isDarkTheme') ?? false;
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e');
  }

  Get.put(ThemeController());
  Get.find<ThemeController>().isDarkTheme.value = isDarkTheme;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.interTextTheme(),
          scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.interTextTheme().copyWith(
              // bodyText1:
              //     TextStyle(color: Colors.white), // Customize your text style
              // bodyText2:
              //     TextStyle(color: Colors.white), // Customize other text styles

              )),
      themeMode: Get.find<ThemeController>().isDarkTheme.value
          ? ThemeMode.dark
          : ThemeMode.light,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
