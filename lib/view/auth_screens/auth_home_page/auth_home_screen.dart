import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/view/auth_screens/LoginWithMobile/login_with_mobile_screen.dart';
import 'package:stellar_chat/view/auth_screens/auth_home_page/show_signup_model_sheet.dart';
import 'package:flutter/material.dart';

import '../../../Settings/SColors.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 51, 142, 1),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(0, 10, 142, 0),
              Color.fromRGBO(153, 199, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage(SImages.vectorBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Center(
              child:
                  Image.asset("assets/Images/stellar_chat_icon_with_name.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => LoginWithMobileNumberScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                decoration: BoxDecoration(
                    color: SColors.color11,
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
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                decoration: BoxDecoration(
                    color: SColors.color12,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(color: SColors.color4),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
