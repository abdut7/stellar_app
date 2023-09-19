import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/LoginPages/OtpVerification/widget/resend_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../Settings/SColors.dart';
import '../../../Settings/SImages.dart';

class OtpVerificationScreen extends StatefulWidget {
  OtpVerificationScreen({Key? key});
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}
class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

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
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(0, 1, 200, 0),
                  Color.fromRGBO(100, 170, 230, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              image: DecorationImage(image: AssetImage(SImages.image1), fit: BoxFit.fill,),
            ),
            child:Center(
              child: Image.asset(SImages.vectorBackground, fit: BoxFit.cover,),),),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 200,),
                  SvgPicture.asset(SSvgs.appLogoAndName),
                  const SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpTextField(
                        numberOfFields: 5,
                        showFieldAsBox: true,
                        borderRadius: BorderRadius.circular(8),
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode){
                          // Do something with the verificationCode if needed
                        },
                        filled: true,
                      ),
                    ],),

                  Padding(
                    padding: const EdgeInsets.only(left: 175),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Didn't receive OTP", style: TextStyle(color:SColors.color4, fontSize: 10, fontWeight: FontWeight.w400,),),
                        ResendButton(),
                      ],
                    ),),
                  const SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: Get.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color:SColors.color11,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Center(
                        child: Text(
                          'Verify', style: TextStyle(color: SColors.color12, fontSize: 17, fontWeight: FontWeight.w500,),),
                      ),),),
                  const SizedBox(height: 10,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '00:30', style: TextStyle(color: SColors.color4, fontSize: 10, fontWeight: FontWeight.w800,
                        ),),
                        TextSpan(
                          text: ' sec remaining',
                          style: TextStyle(color:SColors.color4, fontSize: 10, fontWeight: FontWeight.w400,),),
                      ],),),],
              ),),
        ],),
    );
  }
}

