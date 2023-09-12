import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/View/Chat/CreateNewChat/CreateNewChatUi.dart';
import 'package:base_project/services/api_services/auth_services.dart';
import 'package:base_project/widgets/custom_elevated_button.dart';
import 'package:base_project/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/api_controllers/login_with_phone_controller.dart';

class LoginWithMobileUi extends StatefulWidget {
  static const routeName = '/LoginWithMobileUi ';
  const LoginWithMobileUi({Key? key}) : super(key: key);

  @override
  State<LoginWithMobileUi> createState() => _LoginWithMobileUiState();
}

class _LoginWithMobileUiState extends State<LoginWithMobileUi> {
  TextEditingController regionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Widget _buildTitle() {
    return const Text(
      'Log in with Mobile ',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildSubTitles(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: SColors.color3,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginWithPhoneNumberConteroller login =
        Get.put(LoginWithPhoneNumberConteroller());

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
              height: 50,
            ),
            _buildTitle(),
            const SizedBox(
              height: 70,
            ),
            LoginTextField(
              controller: regionController,
              keyboardType: TextInputType.text,
              labelText: 'REGION',
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            LoginTextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              labelText: 'PHONE',
            ),
            const SizedBox(
              height: 75,
            ),
            CustomElevatedButton(
                text: 'OTP Verification',
                textColor: SColors.color12,
                foregroundColor: SColors.color11,
                backgroundColor: SColors.color4,
                onPressed: () {}),
            const SizedBox(
              height: 75,
            ),
            _buildSubTitles('Log in with Mobile '),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
                text: 'Sign Up',
                textColor: SColors.color4,
                foregroundColor: SColors.color4,
                backgroundColor: SColors.color12,
                onPressed: () {
                  AuthServices().loginService(phoneController.text);
                  // Navigator.pushNamed(context, CreateNewChatUi.routeName);
                }),
            const SizedBox(
              height: 60,
            ),
            _buildSubTitles(
              'The above number is used for login verification',
            ),
          ],
        ),
      ),
    );
  }
}
