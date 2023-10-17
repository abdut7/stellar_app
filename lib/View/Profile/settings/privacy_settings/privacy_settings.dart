import 'package:flutter/cupertino.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/profile/settings/privacy_settings/blocked_user_screen/blocked_users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class PrivacySettings extends StatefulWidget {
  const PrivacySettings({Key? key}) : super(key: key);

  @override
  State<PrivacySettings> createState() => _PrivacySettingsState();
}

bool nearbyVisibility = false;

class _PrivacySettingsState extends State<PrivacySettings> {
  Widget customRow(String title, String suffixText) {
    ThemeController themeController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: themeController.isDarkTheme.value
                ?  SColors.color4
                : SColors.color3,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          suffixText,
          style: TextStyle(
            color: SColors.color11,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget headTitle(String head) {
    return Text(head,
        style: TextStyle(
          color: SColors.color11,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ));
  }

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
          title: Text('Privacy And Security',
              style: TextStyle(
                color: SColors.color11,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
          backgroundColor: SColors.color12,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(SSvgs.appLogo),
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headTitle('Security'),
                const SizedBox(
                  height: 18,
                ),
                customRow('Two - Step Verification', 'off'),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => BlockedUsersScreen());
                    },
                    child: customRow('Blocked User', '')),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chat History',
                      style: TextStyle(
                        color: themeController.isDarkTheme.value
                      ?  SColors.color4
                          : SColors.color3,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: themeController.isDarkTheme.value
                      ?  SColors.color4
                          : SColors.color3,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              thickness: 1,
              color:  themeController.isDarkTheme.value
            ?  Color.fromRGBO(187, 187, 187, 1)
                  : SColors.color3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              headTitle('Privacy'),
              const SizedBox(height: 18),
              customRow('Phone Number', 'My Contact'),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearby Visibility',
                    style: TextStyle(
                      color:  themeController.isDarkTheme.value
                          ?  SColors.color4
                          : SColors.color3,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.65,
                    child: CupertinoSwitch(
                      value: nearbyVisibility,
                      onChanged: (bool newValue) {
                        setState(() {
                          nearbyVisibility = newValue;
                        });
                      },
                      activeColor: SColors.color11,
                    ),
                  ),

                  // IgnorePointer(
                  //   ignoring: true,
                  //   child: Switch(
                  //     value: false,
                  //     onChanged: (bool newValue) {},
                  //     activeColor: SColors.color11,
                  //   ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              thickness: 1,
              color:  themeController.isDarkTheme.value
                  ?  Color.fromRGBO(187, 187, 187, 1)
                  : SColors.color3,
            ),
          ),
        ]));
  }
}
