import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final RxBool isDarkTheme = false.obs;

  void switchTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
    SharedPreferences.getInstance().then((sp) {
      sp.setBool("isDarkTheme", isDarkTheme.value);
    });
  }
}
