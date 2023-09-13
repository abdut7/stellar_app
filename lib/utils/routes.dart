import 'package:base_project/View/Chat/CreateNewChat/CreateNewChatUi.dart';
import 'package:base_project/View/Chat/HomeChat/HomeChatUi.dart';
import 'package:base_project/View/Chat/HomeChat/sub/Case4/sub/EditProfile/EditProfileUi.dart';
import 'package:base_project/View/Chat/HomeChat/sub/Case4/sub/Favorites/Favorites.dart';
import 'package:base_project/View/Chat/HomeChat/sub/Case4/sub/Settings/SettingsUi.dart';
import 'package:base_project/View/Chat/HomeChat/sub/Case4/sub/StickerGallery/StickerGallery.dart';
import 'package:base_project/View/Chat/NewChat/NewChatUi.dart';
import 'package:base_project/View/Contact/AddContact/AddContactUi.dart';
import 'package:base_project/View/LoginPages/LoginWithMobile/LoginWithMobileUi.dart';
import 'package:base_project/View/LoginPages/OtpVerification/OtpVerificationUi.dart';
import 'package:base_project/View/LoginPages/SignUpOptions/SignUpOptionsUi.dart';
import 'package:base_project/View/LoginPages/SignUpWithMobile/SignUpWithMobileUi.dart';
import 'package:base_project/View/LoginPages/WelcomePage/WelcomePageUi.dart';
import 'package:base_project/View/MoneyPayment/MoneyPaymentUi.dart';
import 'package:base_project/View/QRScan/Scanning/ScanningUi.dart';
import 'package:base_project/View/QRScan/TakeScan/TakeScanUi.dart';
import 'package:base_project/features/setup/login/view/login_screen.dart';
import 'package:flutter/material.dart';

import '../View/splash/spalash_screen.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() => {
      SplashScreen.routeName: (context) => const SplashScreen(),
      // LoginScreen.routeName:(context) => const LoginScreen(),
      WelcomePageUi.routeName:(context) => const WelcomePageUi(),
      SignUpOptionsUi.routeName:(context)=> const SignUpOptionsUi(),
      SignUpWithMobileUi.routeName:(context)=> const SignUpWithMobileUi(),
      LoginWithMobileUi.routeName:(context)=> const LoginWithMobileUi(),
      OtpVerificationUi.routeName:(context)=> const OtpVerificationUi(),
      CreateNewChatUi.routeName:(context)=> const CreateNewChatUi(),
      NewChatUi.routeName:(context)=> const NewChatUi(),
      AddContactUi.routeName:(context)=> const AddContactUi(),
      HomeChatUi.routeName:(context)=>  HomeChatUi(),
      MoneyPaymentUi.routeName:(context)=> const MoneyPaymentUi(),
      TakeScanUi.routeName:(context)=> const TakeScanUi(),
      ScanningUi.routeName:(context)=> const ScanningUi(),
      FavoritesScreen.routeName:(context)=> FavoritesScreen(),
      StickerGalleryScreen.routeName:(context)=>  StickerGalleryScreen(),
      SettingsUi.routeName:(context)=>  const SettingsUi(),
      EditProfileUi.routeName:(context)=>  const EditProfileUi(),



    };

Widget? _getScreen(RouteSettings settings) {
  switch (settings.name) {
    // case OwnerManageUserScreen.route:
    //   OwnerManageUserScreenParams params =
    //       settings.arguments as OwnerManageUserScreenParams;
    //   return OwnerManageUserScreen(
    //     params: params,
    //   );

    default:
      return null;
  }
}

RouteFactory onAppGenerateRoute() => (settings) {
      Widget? screen = _getScreen(settings);
      if (screen != null) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => screen,
          transitionsBuilder: (_, a, __, c) {
            return FadeTransition(opacity: a, child: c);
          },
        );
      }
      return null;
    };
