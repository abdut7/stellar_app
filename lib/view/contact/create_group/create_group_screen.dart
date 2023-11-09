import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/contact/create_group/select_participents_screen.dart';
import 'package:stellar_chat/view/contact/create_group/widgets/add_group_icon_widget.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  TextEditingController groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'New Group',
          style: TextStyle(
            color: themeController.isDarkTheme.value
                ?  SColors.appbarTitleInDark
                : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: themeController.isDarkTheme.value
            ?  SColors.appbarbgInDark
            : SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: GestureDetector(
                  onTap: () async {
                    pickedImage =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                  },
                  child: AddGroupIconWidget(file: pickedImage),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                width: Get.width * 0.8,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: TextStyle(
                    color: themeController.isDarkTheme.value
                        ?  Colors.white
                        : SColors.color3,
                  ),
                  controller: groupNameController,
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: " Group Name",
                      hintStyle: TextStyle(
                        color: themeController.isDarkTheme.value
                            ?  SColors.buttonTextIndark
                            : SColors.color3,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      prefix: SizedBox(
                        width: 20,
                      )),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 40),
              //     child: GestureDetector(
              //       onTap: () {},
              //       child: const Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'Group Permission',
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 14,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //             size: 16,
              //             color: Colors.black,
              //           ),
              //         ],
              //       ),
              //     )),
               SizedBox(
                height: Get.height*0.26
              ),
              GestureDetector(
                onTap: () {
                  if (groupNameController.text.isEmpty) {
                    showCustomSnackbar(
                        title: "Invalid Group Name",
                        message: "Please enter a valid name to continue");
                    return;
                  }
                  Get.to(() => SelectGroupParticipents(
                        grpName: groupNameController.text,
                        image: pickedImage,
                      ));
                },
                child: Container(
                  width: Get.width * 0.5,
                  height: 45,
                  decoration: BoxDecoration(
                      color:themeController.isDarkTheme.value
                          ?  SColors.color3
                          : SColors.color12,
                      borderRadius: BorderRadius.circular(10)),
                  child:  Center(
                    child: Text(
                      "Add Participants",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: themeController.isDarkTheme.value
                              ? Color(0xFFB2B2B2)
                              : SColors.color11,),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
