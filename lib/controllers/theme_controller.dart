import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final RxBool isDarkTheme = false.obs;
  final Rx<ThemeData> lightTheme = ThemeData.light().obs;
  final Rx<ThemeData> darkTheme = ThemeData.dark().obs;
  RxBool isInsideDarkScreens = RxBool(false);

  ThemeData get currentTheme =>
      isDarkTheme.value ? darkTheme.value : lightTheme.value;

  void switchTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);

    // Save the selected theme mode to SharedPreferences
    SharedPreferences.getInstance().then((sp) {
      sp.setBool("isDarkTheme", isDarkTheme.value);
    });
  }

  // Load the saved theme mode from SharedPreferences
  Future<void> loadSavedTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isDarkTheme.value = sp.getBool("isDarkTheme") ?? false;
  }
}
