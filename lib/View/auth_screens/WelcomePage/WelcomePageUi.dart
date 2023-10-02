import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/auth_screens/LoginWithMobile/LoginWithMobileUi.dart';
import 'package:stellar_chat/View/auth_screens/SignUpOptions/SignUpOptionsUi.dart';
import 'package:stellar_chat/View/auth_screens/WelcomePage/sub/Section1.dart';
import 'package:stellar_chat/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePageUi extends StatefulWidget {
  static const routeName = '/WelcomePageUi';
  const WelcomePageUi({Key? key}) : super(key: key);

  @override
  State<WelcomePageUi> createState() => _WelcomePageUiState();
}

class _WelcomePageUiState extends State<WelcomePageUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      body: ListView(
        children: [
          const Section1(),
          const SizedBox(
            height: 50,
          ),
          CustomElevatedButton(
              text: 'Login',
              textColor: SColors.color12,
              foregroundColor: SColors.color11,
              backgroundColor: SColors.color4,
              onPressed: () {
                Get.to(() => LoginWithMobileUi());
              }),
          const SizedBox(
            height: 25,
          ),
          CustomElevatedButton(
              text: 'Sign Up',
              textColor: SColors.color4,
              foregroundColor: SColors.color4,
              backgroundColor: SColors.color12,
              onPressed: () {
                Get.to(() => SignUpOptionsUi());
              }),
        ],
      ),
    );
  }
}
