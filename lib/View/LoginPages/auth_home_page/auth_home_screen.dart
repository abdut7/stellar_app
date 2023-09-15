import 'package:base_project/View/LoginPages/LoginWithMobile/login_with_mobile_screen.dart';
import 'package:base_project/View/LoginPages/auth_home_page/show_signup_model_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Settings/SColors.dart';
import '../../../Settings/SSvgs.dart';
import '../../../widgets/custom_signup_option_buttons.dart';
import '../SignUpWithMobile/SignUpWithMobileUi.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 51, 142, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.3,
          ),
          Center(
            child: Image.asset("assets/Images/stellar_chat_icon_with_name.png"),
          ),
          SizedBox(
            height: Get.height * 0.2,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => LoginWithMobileNumberScreen());
            },
            child: Container(
              width: Get.width * 0.4,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(159, 196, 232, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text("Login")),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              showSignupModelBottomSheet(context);
            },
            child: Container(
              width: Get.width * 0.4,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(159, 196, 232, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text("Sign Up")),
            ),
          )
        ],
      ),
    );
  }
}
