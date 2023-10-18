import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/Chat/group_chat/group_info/widgets/group_description_textfield.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class GroupDescriptionScreen extends StatefulWidget {
  const GroupDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<GroupDescriptionScreen> createState() => _GroupDescriptionScreenState();
}

class _GroupDescriptionScreenState extends State<GroupDescriptionScreen> {
  TextEditingController descriptionController = TextEditingController();
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
          'Group\nDescription',
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
      body: Column(
        children: [
          GroupDescTextfield(
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            head: 'Group Description',
            controller: descriptionController,
          ),
          const SizedBox(height: 25,),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              thickness: 1.2,
              color: themeController.isDarkTheme.value
                  ?  SColors.color26
                  : SColors.color3,
            ),
          ),
          const SizedBox(height: 40,),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              decoration: BoxDecoration(
                color: themeController.isDarkTheme.value
                    ?  SColors.color26
                    : SColors.color12,
                borderRadius: BorderRadius.circular(8),
              ),
              child:  Center(
                child: Text(
                  'Update',
                  style: TextStyle(
                      fontSize: 14,
                      color: themeController.isDarkTheme.value
                          ?  SColors.color4
                          : SColors.color11
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
