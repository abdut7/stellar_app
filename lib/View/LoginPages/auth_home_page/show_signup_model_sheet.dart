import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Settings/SColors.dart';
import '../../../Settings/SSvgs.dart';
import '../../../widgets/custom_signup_option_buttons.dart';
import '../SignUpWithMobile/SignUpWithMobileUi.dart';

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
          color: Colors.amber,
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
            CustomButton(
              onPressed: () {
                Get.to(() => SignUpWithMobileUi());
              },
              text: 'SignUp With Phone',
              textColor: SColors.color3,
              backgroundColor: SColors.color4,
              foregroundColor: SColors.color11,
              prefixIcon: Icons.phone_android,
              svgAssetPath: null,
            ),
            const SizedBox(height: 30),
            Divider(thickness: 1, color: SColors.color3),
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
              backgroundColor: SColors.color3,
              foregroundColor: SColors.color4,
              prefixIcon: null,
              svgAssetPath: SSvgs.sv03,
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              text: 'Sign Up With Google',
              textColor: Colors.white,
              backgroundColor: SColors.color3,
              foregroundColor: SColors.color4,
              prefixIcon: null,
              svgAssetPath: SSvgs.sv04,
            ),
          ],
        ),
      );
    },
  );
}
