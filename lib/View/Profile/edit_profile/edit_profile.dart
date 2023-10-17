import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/Profile/edit_profile/widget/about_me_textfield.dart';
import 'package:stellar_chat/View/Profile/edit_profile/widget/profile_update_button.dart';
import 'package:stellar_chat/View/profile/widget/profile_buttons.dart';
import 'package:stellar_chat/View/profile/widget/profile_text_field.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:stellar_chat/services/token_service/token_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  UserController userController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    nameController.text = userController.userDetailsModel.value!.strName;
    userNameController.text =
        userController.userDetailsModel.value!.strFullName.isEmpty
            ? userController.userDetailsModel.value!.strName
            : userController.userDetailsModel.value!.strFullName;
    aboutMeController.text = userController.userDetailsModel.value!.strAbout;

    // aboutMeController.text = userController.userDetailsModel.value!.;
    super.initState();
  }

  bool isLoading = false;
  ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    UserController controller = Get.find();
    return Scaffold(
      backgroundColor:  themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: themeController.isDarkTheme.value ?  SColors.appbarTitleInDark : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: themeController.isDarkTheme.value ?  SColors.appbarbgInDark : SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    color: SColors.color4,
                    shape: const CircleBorder(),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipOval(
                        child: pickedImage != null
                            ? Image.file(
                          File(pickedImage!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                            : Image.network(
                          controller.userDetailsModel.value!.strProfileUrl
                              .isEmpty
                              ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                              : controller
                              .userDetailsModel.value!.strProfileUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            backgroundColor:
                            const Color.fromRGBO(159, 196, 232, 1),
                            builder: (BuildContext context) {
                              return Wrap(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 15),
                                    child: Divider(
                                      thickness: 2,
                                      color: Color.fromRGBO(0, 51, 142, 0.5),
                                    ),
                                  ),
                                  ListTile(
                                    //leading:  Icon(Icons.photo_library,color: SColors.color12,),
                                    title: Center(
                                      child: Text(
                                        'Upload Photo',
                                        style: TextStyle(
                                          color: SColors.color12,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the bottom sheet
                                      pickedImage = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      if (pickedImage != null) {
                                        setState(() {});
                                      }
                                    },
                                  ),
                                  ListTile(
                                    //leading:  Icon(Icons.photo_camera,color: SColors.color12,),
                                    title: Center(
                                      child: Text(
                                        'Take a Photo',
                                        style: TextStyle(
                                          color: SColors.color12,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the bottom sheet
                                      pickedImage = await picker.pickImage(
                                          source: ImageSource.camera);
                                      if (pickedImage != null) {
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: SColors.color12,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Change Photo',
                  style: TextStyle(
                    color:  themeController.isDarkTheme.value ?  SColors.color4 : SColors.color3,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ProfileTextField(
              keyboardType: TextInputType.text,
              head: 'Name',
              controller: nameController,
            ),
            ProfileTextField(
              keyboardType: TextInputType.text,
              head: 'Username',
              controller: userNameController,
            ),
            ProfileTextField2(
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              head: 'About me',
              controller: aboutMeController,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                thickness: 0.8,
                color: themeController.isDarkTheme.value ?  Color.fromRGBO(187, 187, 187, 1)
                    : SColors.color3,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Privacy and Settings',
            //         style: TextStyle(
            //           color: SColors.color3,
            //           fontSize: 15,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       GestureDetector(
            //           onTap: () {},
            //           child: const Icon(
            //             Icons.arrow_forward_ios,
            //             size: 20,
            //           ))
            //     ],
            //   ),
            // ),
            SizedBox(height: Get.height * 0.2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ProfileUpdateButton(
                  buttonText: isLoading ? "Updating..." : 'Update',
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    bool isSuccess = await AccountServices.updateUserProfile(
                        uid: userController.userDetailsModel.value!.id,
                        aboutMe: aboutMeController.text,
                        name: nameController.text,
                        username: userNameController.text,
                        image: pickedImage);

                    if (isSuccess) {
                      await getUserDetailsonRefresh();
                      Get.back();
                    }

                    // showBottomSheet(context, 'profile');
                  }),
            )
          ],
        ),
      )
    );
  }
}

void showBottomSheet(BuildContext context, String action) {
  showModalBottomSheet(
    context: context,
    backgroundColor: SColors.color11,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (action == 'profile')
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Divider(
                  thickness: 2,
                  color: Color.fromRGBO(0, 51, 142, 0.5),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Profile Updated',
                style: TextStyle(
                  color: SColors.color3,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            if (action !=
                'photo') // Condition to exclude "Continue" button for action 'photo'
              ProfileButton(buttonText: 'Continue', onPressed: () {}),
            if (action == 'photo')
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Upload Photo',
                      style: TextStyle(
                        color: SColors.color12,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  //const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Take Photo',
                      style: TextStyle(
                        color: SColors.color12,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
    },
  );
}
