import 'dart:io';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/view/auth_screens/LoginWithMobile/login_with_mobile_screen.dart';
import 'package:stellar_chat/controllers/api_controllers/signup_controllers.dart';
import 'package:stellar_chat/functions/location_permission.dart';
import 'package:stellar_chat/services/api_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stellar_chat/view/auth_screens/signup_with_mobile/widgets/region_selction_dropdown_widget.dart';
import 'package:stellar_chat/view/auth_screens/signup_with_mobile/widgets/text_form_filed_widget.dart';

import '../../../Settings/SImages.dart';
import '../../../functions/get_current_location.dart';
import '../../../functions/image_to_base.dart';
import '../../../models/api_models/signup_model.dart';

class SignUpWithMobileScreen extends StatefulWidget {
  const SignUpWithMobileScreen({super.key});

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
    super.dispose();
  }

  @override
  void initState() {
    phoneNumberController.addListener(() {
      validateForm();
    });
    usernameController.addListener(() {
      validateForm();
    });
    emailController.addListener(() {
      validateForm();
    });
    regionController.addListener(() {
      validateForm();
    });
    passwordController.addListener(() {
      validateForm();
    });
    birthDayController.addListener(() {
      validateForm();
    });
    requestLocationPermission();
    super.initState();
  }

  DateTime birthDate = DateTime.now();

  ImagePicker picker = ImagePicker();
  List<String> regions = ['INDIA', 'UAE'];
  String? selectedRegion;

  XFile? pickedImage;

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validateBirthday(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birthday is required';
    }
    return null;
  }

  String? validateRegion(String? value) {
    if (value == null || value.isEmpty) {
      return 'Region is required';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    // if (value.length != 10) {
    //   return 'Phone number must be 10  digits long';
    // }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(SImages.vectorBackground),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              SColors.color12,
              SColors.color12.withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: Get.width * 0.80,
                      //height: Get.height * 0.9,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(153, 199, 255, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Sign Up\nwith Mobile",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: SColors.color12,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () async {
                                    pickedImage = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    setState(() {});
                                  },
                                  child: pickedImage == null
                                      ? Image.asset(
                                          SImages.image2,
                                          height: 85,
                                          width: 85,
                                        )
                                      : CircleAvatar(
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
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormFieldWidget(
                              inputType: TextInputType.name,
                              controller: usernameController,
                              hintText: "User name",
                              size: size,
                              validator: validateUserName,
                            ),
                            TextFormFieldWidget(
                              inputType: TextInputType.emailAddress,
                              controller: emailController,
                              hintText: "Email",
                              size: size,
                              validator: validateEmail,
                            ),
                            RegionSelectionDropdownWidget(
                                validator: validateRegion,
                                controller: regionController,
                                size: size,
                                selectedRegion: selectedRegion,
                                regions: regions),
                            InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: birthDate,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  birthDate = pickedDate;
                                  birthDayController.text =
                                      "${birthDate.day}-${birthDate.month}-${birthDate.year}";
                                }
                                validateForm();
                              },
                              child: IgnorePointer(
                                child: TextFormFieldWidget(
                                  inputType: TextInputType.text,
                                  controller: birthDayController,
                                  hintText: "Birthday",
                                  size: size,
                                  validator: validateBirthday,
                                ),
                              ),
                            ),
                            TextFormFieldWidget(
                              inputType: TextInputType.phone,
                              controller: phoneNumberController,
                              hintText: "Phone",
                              size: size,
                              validator: validatePhoneNumber,
                            ),
                            TextFormFieldWidget(
                              inputType: TextInputType.visiblePassword,
                              controller: passwordController,
                              hintText: "Password",
                              size: size,
                              validator: validatePassword,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Obx(() => signupController
                                        .isLoading.value
                                    ? Center(
                                        child: LoadingAnimationWidget
                                            .threeRotatingDots(
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          if (!validateForm()) {
                                            return;
                                          }
                                          // return;
                                          signupController.isLoading(true);
                                          String base64String = '';

                                          if (pickedImage != null) {
                                            base64String = await filePathToBase(
                                                pickedImage!.path);
                                          }
                                          Position pos =
                                              await getCurrentLocation();

                                          SignupModel signupModel = SignupModel(
                                              username: usernameController.text,
                                              filePath: base64String,
                                              fullName: fullNameController.text,
                                              email: emailController.text,
                                              birthday: birthDayController.text,
                                              region: regionController.text,
                                              phoneNumber:
                                                  phoneNumberController.text,
                                              password: passwordController.text,
                                              coordinates: [
                                                pos.latitude.toString(),
                                                pos.longitude.toString()
                                              ]);
                                          // print(signupModel.toString());
                                          AuthServices()
                                              .signupUser(signupModel);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            width: Get.width * 0.6,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  0, 51, 142, 1),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "OTP Verification",
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      159, 196, 232, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                              ),
                            ),
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
                          //showSignupModelBottomSheet(context);
                          Get.to(LoginWithMobileNumberScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have a account?',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: SColors.color9,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: SColors.color3,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
