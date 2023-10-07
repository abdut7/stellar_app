import 'package:google_fonts/google_fonts.dart';
import 'package:stellar_chat/View/splash/spalash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final isDarkTheme = sharedPreferences.getBool('isDarkTheme') ?? false;

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
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
