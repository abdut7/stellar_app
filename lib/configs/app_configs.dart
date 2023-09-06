import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class AppConfig {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  GlobalKey bottomNavigationKey = GlobalKey();
  static bool isDebugMode = true;

  ///  [isWeb] is true when app is running in web
  ///
  static bool isWeb = kIsWeb;
  static double webCutOffWidth = 1280;

  static String sessionHandlingKey = '321e38e5-3603-4405-bb7a-c9ea44b4';
  static String routerKey = '321e38e5-3603-4405-bb7a-c9ea44b4';

  static const String dbName = "";
  static const int dbVersion = 1;
  
}
