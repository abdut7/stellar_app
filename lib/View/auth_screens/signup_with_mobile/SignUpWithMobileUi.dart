import 'dart:io';

import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/functions/get_current_location.dart';
import 'package:base_project/models/api_models/signup_model.dart';
import 'package:base_project/services/api_services/auth_services.dart';
import 'package:base_project/widgets/custom_elevated_button.dart';
import 'package:base_project/widgets/login_signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../controllers/api_controllers/signup_controllers.dart';
import '../../../functions/image_to_base.dart';
import '../../../functions/location_permission.dart';


class SignUpWithMobileUi extends StatefulWidget {
  static const routeName = '/SignUpWithMobileUi';

  const SignUpWithMobileUi({Key? key}) : super(key: key);

  @override
  State<SignUpWithMobileUi> createState() => _SignUpWithMobileUiState();
}

class _SignUpWithMobileUiState extends State<SignUpWithMobileUi> {
  SignupController signupController = Get.put(SignupController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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

  ImagePicker picker = ImagePicker();
  XFile? pickedImage;

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
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Sign Up with Mobile ',
                    style: TextStyle(
                        color: SColors.color3,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                      pickedImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: pickedImage == null
                        ? const Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 30,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(87, 87, 87, 1),
                                  radius: 10,
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ))
                            ],
                          )
                        : CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                              child: Image.file(
                                File(pickedImage!.path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // LoginTextField(
              //     controller: usernameController,
              //     keyboardType: TextInputType.text,
              //     labelText: 'User Name'),
              LoginTextField(
                  controller: fullNameController,
                  keyboardType: TextInputType.text,
                  labelText: 'Full Name'),
              LoginTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email'),
              LoginTextField(
                  controller: birthDayController,
                  isBirthday: true,
                  keyboardType: TextInputType.text,
                  labelText: 'Birthday'),
              LoginTextField(
                controller: regionController,
                keyboardType: TextInputType.text,
                labelText: 'Region',
                suffixIcon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              LoginTextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  labelText: 'Phone'),
              LoginTextField(
                  isPassword: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: 'Password'),
              const SizedBox(
                height: 30,
              ),
              termsOfServiceText(),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => signupController.isLoading.value
                    ? Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    : CustomElevatedButton(
                        text: 'Accept and Continue',
                        textColor: SColors.color4,
                        foregroundColor: SColors.color4,
                        backgroundColor: SColors.color12,
                        onPressed: () async {
                          signupController.isLoading(true);
                          String base64String = '';

                          if (pickedImage != null) {
                            base64String = await filePathToBase(pickedImage!.path);
                          }
                          Position pos = await getCurrentLocation();

                          SignupModel signupModel = SignupModel(
                              username: usernameController.text,
                              filePath: base64String,
                              fullName: fullNameController.text,
                              email: emailController.text,
                              birthday: birthDayController.text,
                              region: regionController.text,
                              phoneNumber: phoneNumberController.text,
                              password: passwordController.text,
                              coordinates: [
                                pos.latitude.toString(),
                                pos.longitude.toString()
                              ]);
                          AuthServices().signupUser(signupModel);
                        }),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          )),
    );
  }
}
