import 'dart:io';

import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/controllers/api_controllers/signup_controllers.dart';
import 'package:base_project/functions/location_permission.dart';
import 'package:base_project/services/api_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Settings/SImages.dart';
import '../../../widgets/login_signup_textfield.dart';

class SignUpWithMobileScreen extends StatefulWidget {
  SignUpWithMobileScreen({super.key});

  @override
  State<SignUpWithMobileScreen> createState() => _SignUpWithMobileScreenState();
}

class _SignUpWithMobileScreenState extends State<SignUpWithMobileScreen> {
  SignupController signupController = Get.put(SignupController());
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    regionController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    birthDayController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    requestLocationPermission();
    super.initState();
  }

  DateTime birthDate = DateTime.now();

  ImagePicker picker = ImagePicker();
  XFile? pickedImage;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 51, 142, 1),
          Color.fromRGBO(153, 199, 255, 1),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(SImages.image1),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.75,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(153, 199, 255, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black, offset: Offset(0.0, 0.0), blurRadius: 0.0, spreadRadius: 0.0,), //BoxS
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Sign Up\nwith Mobile",
                                style: TextStyle(color: Color.fromRGBO(0, 51, 142, 1), fontSize: 26, fontWeight: FontWeight.w800,),),
                              const SizedBox(width: 10),
                              GestureDetector(
                                  onTap: () async {
                                    pickedImage =
                                    await picker.pickImage(source: ImageSource.gallery);
                                    setState(() {});
                                  },
                                  child:  pickedImage == null?
                                  Image.asset(
                                    SImages.image2,
                                    height: 85,
                                    width: 85,
                                  ): CircleAvatar(
                                    radius: 40,
                                    child: ClipOval(
                                      child: Image.file(
                                        File(pickedImage!.path),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          LoginTextField(
                            controller: usernameController,
                            keyboardType: TextInputType.text,
                            labelText: 'User Name',
                          ),
                          LoginTextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Email'),
                          LoginTextField(
                            controller: birthDayController,
                            keyboardType: TextInputType.text,
                            labelText: 'Birthday',
                            isBirthday: true,
                          ),
                          LoginTextField(
                              controller: regionController,
                              keyboardType: TextInputType.text,
                              labelText: 'Region'),
                          LoginTextField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              labelText: 'Phone'),
                          LoginTextField(
                              controller: usernameController,
                              keyboardType: TextInputType.text,
                              labelText: 'Password'),
                          const SizedBox(
                            height: 30,
                          ),


                          Center(
                            child: GestureDetector(
                              onTap: () {
                                AuthServices().loginService(phoneNumberController.text);
                              },
                              child: Container(
                                width: Get.width * 0.7,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 51, 142, 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    "OTP Verification",
                                    style: TextStyle(fontSize: 14,
                                        color: Color.fromRGBO(159, 196, 232, 1)),
                                  ),),),),
                          ),],),),),


                  Container(
                      height: 70,
                      width: Get.width * 0.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          //showSignupModelBottomSheet(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have a account?',
                              style: TextStyle(color: SColors.color9, fontSize: 12, fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Sign In", style: TextStyle(
                                  color: SColors.color3, fontWeight: FontWeight.bold),
                            ),],),)),],
              ),),),
        ),),
    );
  }
}
