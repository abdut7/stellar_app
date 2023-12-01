import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/view/auth_screens/auth_home_page/widget/sign_up_with_phone_Button.dart';
import 'package:stellar_chat/view/auth_screens/signup_with_mobile/sign_up_with_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Settings/SColors.dart';
import '../../../Settings/SSvgs.dart';
import '../../../widgets/custom_signup_option_buttons.dart';

Future<dynamic> showSignupModelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) {
      return Container(
        height: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            scale: 2,
            image: AssetImage(
              'assets/Images/signup_select_background.png',
            ),
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            SignUpWithPhoneButton(
              onPressed: () {
                Get.to(() => SignUpWithMobileScreen());
              },
              text: 'SignUp With Mobile',
              textColor: SColors.color3,
              backgroundColor: SColors.color4,
              foregroundColor: SColors.color11,
              prefixIcon: Icons.phone_android,
              svgAssetPath: null,
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              text: 'Sign Up With Apple',
              textColor: Colors.white,
              backgroundColor: SColors.color3,
              foregroundColor: SColors.color4,
              prefixIcon: null,
              svgAssetPath: SSvgs.sv02,
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              text: 'Sign Up With Facebook',
              textColor: Colors.white,
              backgroundColor: const Color(0xff3b5998),
              foregroundColor: SColors.color4,
              prefixIcon: null,
              imageAssetPath: SImages.facebook,
              svgColor: Colors.white,
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              text: 'Sign Up With Google',
              textColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              foregroundColor: SColors.color4,
              prefixIcon: null,
              imageAssetPath: SImages.signGoogle,
            ),
          ],
        ),
      );
    },
  );
}
