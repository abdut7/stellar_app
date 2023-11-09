import 'package:flutter/cupertino.dart';
import 'package:stellar_chat/view/Favorites/Favorites.dart';
import 'package:stellar_chat/view/StickerGallery/StickerGallery.dart';
import 'package:stellar_chat/view/help_article/help_article_screen.dart';
import 'package:stellar_chat/view/profile/settings/privacy_settings/privacy_settings.dart';
import 'package:stellar_chat/services/token_service/token_service.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/profile/qr/qr_screen.dart';
import 'package:stellar_chat/view/profile/widget/profile_settings_tile.dart';
import 'package:stellar_chat/controllers/user_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/theme_controller.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final ThemeController darkThemeController = Get.find();
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    UserController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeController.isDarkTheme.value
            ? SColors.darkmode
            : SColors.color4,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: Get.height * 0.36,
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        controller.userDetailsModel.value!.strProfileUrl.isEmpty
                            ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                            : controller.userDetailsModel.value!.strProfileUrl,
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: Get.width,
                      ),
                      Positioned(
                        top: 250,
                        left: 20,
                        child: Text(
                          controller.userDetailsModel.value!.strName,
                          style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color11,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        left: 20,
                        child: Text(
                          'Online',
                          style: TextStyle(
                            color: themeController.isDarkTheme.value
                                ? SColors.color4
                                : SColors.color11,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   top: 280,
                //   right: 60,
                //   bottom: 0,
                //   child: GestureDetector(
                //       onTap: () {}, child: SvgPicture.asset(SSvgs.editIcon)),
                // ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const QRScreen(
                            isFromSettings: true,
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        SSvgs.qr,
                        color: themeController.isDarkTheme.value
                            ? SColors.color3
                            : SColors.color4,
                        height: 25,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomListTilee(
              text: 'Favorites',
              onTap: () {
                Get.to(() => FavoritesScreen());
              },
              svgAsset: themeController.isDarkTheme.value
                  ? SSvgs.favouriteDark
                  : SSvgs.sv25,
            ),
            Column(
              children: [
                CustomListTilee(
                  text: 'Sticker Gallery',
                  onTap: () {
                    Get.to(() => StickerGalleryScreen());
                  },
                  svgAsset: themeController.isDarkTheme.value
                      ? SSvgs.stickerDark
                      : SSvgs.sv27,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Divider(
                    color: themeController.isDarkTheme.value
                        ? Color.fromRGBO(187, 187, 187, 1)
                        : SColors.color3,
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Text('Settings',
                      style: TextStyle(
                        color: SColors.color11,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => PrivacySettings());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Privacy and Security',
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Dark Mode',
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                          value: darkThemeController.isDarkTheme.value,
                          onChanged: (bool newValue) {
                            darkThemeController.switchTheme();
                            setState(() {});
                          },
                          activeColor: SColors.color11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Text('Help ',
                        style: TextStyle(
                          color: SColors.color11,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HelpArticleScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Find Contacts',
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Stellar Chat FAQ',
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: themeController.isDarkTheme.value
                              ? SColors.color4
                              : SColors.color3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Text('Delete My Account ',
                          style: TextStyle(
                            color: SColors.color11,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: GestureDetector(
                        onTap: () {
                          logoutUser();
                        },
                        child: Text(
                          'LOG OUT',
                          style: TextStyle(
                            color: SColors.color17,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: Text(
                            'Delete My Account',
                            style: TextStyle(
                              color: SColors.color17,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
