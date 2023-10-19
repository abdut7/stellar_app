import 'package:share_plus/share_plus.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/Contact/add_contact/select_contacts_to_add_screen.dart';
import 'package:stellar_chat/View/contact/add_contact/friends_in_radar/friends_in_radar.dart';
import 'package:stellar_chat/View/contact/add_contact/scan_qr_code.dart';
import 'package:stellar_chat/View/contact/show_contact/show_contacts_screen.dart';
import 'package:stellar_chat/View/profile/qr/qr_screen.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/functions/share_or_copy.dart';
import 'package:stellar_chat/widgets/add_contact_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/contacts_controller.dart';

class AddContactUi extends StatefulWidget {
  static const routeName = '/AddContactUi';
  const AddContactUi({Key? key}) : super(key: key);

  @override
  State<AddContactUi> createState() => _AddContactUiState();
}

class _AddContactUiState extends State<AddContactUi> {
  ContactsController contactsController = Get.put(ContactsController());
  AppBar _buildAppBar() {
    ThemeController themeController = Get.find();
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      title: Text(
        'Add Contact',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          AddContactListTile(
            text: 'Invite Friends',
            subtitle: 'Invite friends to chat using the app',
            onPressed: () {
              Share.share('check out stellar chat https://stellarchat.io',
                  subject: 'Come connect me on Stellar chat');
            },
            svgAssetPath: SSvgs.invite,
            svgColor: themeController.isDarkTheme.value
                ?  SColors.color26
                : SColors.color12,
          ),
          AddContactListTile(
            text: 'Friends In Radar',
            subtitle: 'Add friends Nearby',
            onPressed: () {
              Get.to(() => const FriendsInRadarScreen());
            },
            svgAssetPath: SSvgs.radar,
            svgColor: themeController.isDarkTheme.value
                ?  SColors.color26
                : SColors.color12,
          ),
          AddContactListTile(
              text: 'Use QR Code',
              subtitle: 'Scan your QR code',
              onPressed: () {
                Get.to(
                  () => const QRScreen(),
                );
              },
              svgAssetPath: SSvgs.qr,
            svgColor: themeController.isDarkTheme.value
                ?  SColors.color26
                : SColors.color12,
          ),
          AddContactListTile(
              text: 'My Contact',
              subtitle: 'Add from mobile contact',
              onPressed: () {
                Get.to(() => const ShowContactsScreen());
              },
              svgAssetPath: themeController.isDarkTheme.value
                  ? SSvgs.chatDark
                  : SSvgs.myContactt,
          ),
        ],
      ),
    );
  }
}
