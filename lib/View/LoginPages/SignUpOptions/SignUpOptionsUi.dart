import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/LoginPages/SignUpWithMobile/SignUpWithMobileUi.dart';
import 'package:base_project/widgets/custom_signup_option_buttons.dart';
import 'package:flutter/material.dart';

class SignUpOptionsUi extends StatefulWidget {
  static const routeName = '/SignUpOptionsUi';
  const SignUpOptionsUi({Key? key}) : super(key: key);

  @override
  State<SignUpOptionsUi> createState() => _SignUpOptionsUiState();
}

class _SignUpOptionsUiState extends State<SignUpOptionsUi> {
  Widget orText(){
    return  const Center(
      child: Text('or', style: TextStyle(
        color: Colors.black, fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      ),
    );
  }

  Widget bottomSheetContent() {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        color: SColors.color13.withOpacity(0.8),
      ),
      child: ListView(
        children: [
          const SizedBox(height: 50),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUpWithMobileUi.routeName);
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
          orText(),
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      bottomSheet: bottomSheetContent(),
    );
  }
}


