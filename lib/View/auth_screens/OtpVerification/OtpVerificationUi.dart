import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/auth_screens/LoginWithMobile/LoginWithMobileUi.dart';
import 'package:base_project/View/base_bottom_nav/bottom_nav.dart';
import 'package:base_project/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OtpVerificationUi extends StatefulWidget {
  static const routeName = '/OtpVerificationUi ';
  const OtpVerificationUi({Key? key}) : super(key: key);

  @override
  State<OtpVerificationUi> createState() => _OtpVerificationUiState();
}

class _OtpVerificationUiState extends State<OtpVerificationUi> {
  Widget _buildTitle() {
    return Text(
      'OTP VERIFICATION',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: SColors.color3,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildOtpTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 75),
      height: 55,
      decoration: ShapeDecoration(
        color: SColors.color4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: SColors.color3,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color13,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.cancel_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(SImages.image1),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            SizedBox(
                height: 75,
                child: SvgPicture.asset(
                  SSvgs.sv01,
                )),
            const SizedBox(
              height: 65,
            ),
            _buildTitle(),
            const SizedBox(
              height: 20,
            ),
            _buildOtpTextField(),
            const SizedBox(
              height: 300,
            ),
            CustomElevatedButton(
                text: 'Accept and Continue',
                textColor: SColors.color4,
                foregroundColor: SColors.color4,
                backgroundColor: SColors.color12,
                onPressed: () {
                  Get.offAll(() => BaseBottomNavigation());
                }),
          ],
        ),
      ),
    );
  }
}
