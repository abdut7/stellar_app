import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/auth_screens/OtpVerification/widgets/resend_button.dart';
import 'package:stellar_chat/services/api_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OtpVerificationUi extends StatefulWidget {
  static const routeName = '/OtpVerificationUi ';
  const OtpVerificationUi({Key? key, required this.otpToken}) : super(key: key);
  final String otpToken;

  @override
  State<OtpVerificationUi> createState() => _OtpVerificationUiState();
}

TextEditingController otp_controller = TextEditingController();

class _OtpVerificationUiState extends State<OtpVerificationUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color12,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(0, 1, 200, 0),
                Color.fromRGBO(100, 170, 230, 1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              image: DecorationImage(
                image: AssetImage(SImages.image1),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Image.asset(
                SImages.vectorBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                SvgPicture.asset(SSvgs.appLogoAndName),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpTextField(
                      keyboardType: TextInputType.number,
                      numberOfFields: 5,
                      showFieldAsBox: true,
                      borderRadius: BorderRadius.circular(8),
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {},
                      filled: true,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 175),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Didn't receive OTP",
                        style: TextStyle(
                          color: SColors.color4,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ResendButton(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    AuthServices.otpVerificationService(
                        otp: otp_controller.text, otpToken: widget.otpToken);
                  },
                  child: Container(
                    width: Get.width * 0.5,
                    height: 50,
                    decoration: BoxDecoration(
                      color: SColors.color11,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: SColors.color12,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '00:30',
                        style: TextStyle(
                          color: SColors.color4,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: ' sec remaining',
                        style: TextStyle(
                          color: SColors.color4,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
