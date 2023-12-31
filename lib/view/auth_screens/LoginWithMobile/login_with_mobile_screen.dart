import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/auth_screens/LoginWithMobile/widgets/login_phone_textfield.dart';
import 'package:stellar_chat/view/auth_screens/LoginWithMobile/widgets/login_region_textfield.dart';
import 'package:stellar_chat/view/auth_screens/auth_home_page/show_signup_model_sheet.dart';
import 'package:stellar_chat/services/api_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Settings/SImages.dart';
import '../../../controllers/api_controllers/login_with_phone_controller.dart';

// ignore: must_be_immutable
class LoginWithMobileNumberScreen extends StatelessWidget {
  LoginWithMobileNumberScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  String phone = '';
  bool isIssues = false;
  String? validateRegion(String? value) {
    if (value == null || value.isEmpty) {
      return 'Region is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    LoginWithPhoneNumberConteroller loginController =
        Get.put(LoginWithPhoneNumberConteroller());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(SImages.vectorBackground),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(colors: [
            SColors.color12,
            SColors.color12.withOpacity(0.8),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Form(
          key: _key,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(SImages.image1),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(153, 199, 255, 1),
                        boxShadow: [
                          // BoxShadow(
                          //   color:
                          //       Colors.black.withOpacity(0.5), // Shadow color
                          //   spreadRadius: 5, // Spread radius
                          //   blurRadius: 7, // Blur radius
                          //   offset: Offset(1,
                          //       0), // Offset to control the position of the shadow
                          // ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color.fromRGBO(0, 51, 142, 1),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "with Mobile",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color.fromRGBO(0, 51, 142, 1),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          LoginRegionTextField(
                            //validator: validateRegion,
                            controller: regionController,
                            keyboardType: TextInputType.text,
                            labelText: 'REGION',
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: SColors.color3,
                            ),
                          ),
                          LoginPhoneTextField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            labelText: 'PHONE',
                            onChanged: (val) {
                              if (isIssues == true) {
                                _key.currentState!.validate();
                              }
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }
                              if (value.length != 10) {
                                return 'Invalid phone number';
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'Enter a valid phone number';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              phone = val!;
                            },
                          ),
                          const Spacer(),
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                // code to get and append country code
                                //publiccountry code is used
                                String countryCode = publiccountryCode == null
                                    ? "+91"
                                    : publiccountryCode!.dialCode.toString();

                                if (_key.currentState!.validate()) {
                                  isIssues = false;
                                  _key.currentState!.save();
                                  AuthServices().loginService(
                                      phoneNumberController.text
                                      // "$countryCode${phoneNumberController.text}"
                                      );
                                } else {
                                  isIssues = true;
                                }
                              },
                              child: Container(
                                width: Get.width * 0.6,
                                height: 43,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 51, 142, 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Obx(() => Center(
                                      child: loginController.isLoading.value
                                          ? LoadingAnimationWidget.beat(
                                              color: Colors.white,
                                              size: 20,
                                            )
                                          : const Text(
                                              "OTP Verification",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    159, 196, 232, 1),
                                              ),
                                            ),
                                    )),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 70,
                      width: Get.width * 0.7,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: Offset(0, 5))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showSignupModelBottomSheet(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF606060),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  color: SColors.color3,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
