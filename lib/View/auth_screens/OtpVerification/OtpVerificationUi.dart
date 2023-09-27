import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/services/api_services/auth_services.dart';
import 'package:base_project/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpVerificationUi extends StatefulWidget {
  static const routeName = '/OtpVerificationUi ';
  const OtpVerificationUi({Key? key, required this.otpToken}) : super(key: key);
  final String otpToken;

  @override
  State<OtpVerificationUi> createState() => _OtpVerificationUiState();
}

TextEditingController otp_controller = TextEditingController();

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
        controller: otp_controller,
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
                  AuthServices.otpVerificationService(
                      otp: otp_controller.text, otpToken: widget.otpToken);
                }),
          ],
        ),
      ),
    );
  }
}
