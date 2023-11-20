import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_chat/view/create_post/create_post_home.dart';
import 'package:stellar_chat/view/splash/spalash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stellar_chat/functions/get_fcm_token.dart';
import 'package:stellar_chat/services/firebase_service.dart';
import 'firebase_options.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/hive_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  final sharedPreferences = await SharedPreferences.getInstance();
  final isDarkTheme = sharedPreferences.getBool('isDarkTheme') ?? false;
  await initHive();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e');
  }

  print("token");
  print(await getFCMToken());

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
          textTheme: GoogleFonts.interTextTheme()),
      themeMode: Get.find<ThemeController>().isDarkTheme.value
          ? ThemeMode.dark
          : ThemeMode.light,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
