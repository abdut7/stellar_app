import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/View/LoginPages/OtpVerification/OtpVerificationUi.dart';
import 'package:base_project/widgets/custom_elevated_button.dart';
import 'package:base_project/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';

class SignUpWithMobileUi extends StatefulWidget {
  static const routeName = '/SignUpWithMobileUi';

  const SignUpWithMobileUi({Key? key}) : super(key: key);

  @override
  State<SignUpWithMobileUi> createState() => _SignUpWithMobileUiState();
}

class _SignUpWithMobileUiState extends State<SignUpWithMobileUi> {
  Widget termsOfServiceText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "I have read and accept the Terms of Service",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
        Text(
          "The information collected on this page is only used",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
        Text(
          "for account registration.",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildTitle(){
    return  Text(
      'Sign Up with Mobile ',
      style: TextStyle(
          color: SColors.color3,
          fontSize: 17,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.20),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                 _buildTitle(),
                  const SizedBox(height: 50,),
                  GestureDetector(onTap: () {}, child: Image(image: AssetImage(SImages.image3,)))],
              ),
              const SizedBox(height: 30,),
              const LoginTextField(keyboardType: TextInputType.text, labelText: 'User Name'),
              const SizedBox(height: 15,),
              const LoginTextField(keyboardType: TextInputType.emailAddress, labelText: 'Email'),
              const SizedBox(height: 15,),
              const LoginTextField(keyboardType: TextInputType.text, labelText: 'Birthday'),
              const SizedBox(height: 15,),
              const LoginTextField(
                keyboardType: TextInputType.text, labelText: 'Region',
                suffixIcon: Icon(Icons.arrow_forward_ios, size: 20,),
              ),
              const SizedBox(height: 15,),
              const LoginTextField(keyboardType: TextInputType.phone, labelText: 'Phone'),
              const SizedBox(height: 15,),
              const LoginTextField(keyboardType: TextInputType.visiblePassword, labelText: 'Password'),
              const SizedBox(height: 30,),
              termsOfServiceText(),
              const SizedBox(height: 50,),
              CustomElevatedButton(
                  text: 'Accept and Continue',
                  textColor: SColors.color4,
                  foregroundColor: SColors.color4,
                  backgroundColor: SColors.color12,
                  onPressed: () {
                    Navigator.pushNamed(context, OtpVerificationUi.routeName);
                  }),
              const SizedBox(height: 25,),
            ],
          )),
    );
  }
}
