import 'package:stellar_chat/View/Contact/add_contact/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/contact/add_contact/scan_qr_code.dart';
import 'package:stellar_chat/View/contact/add_contact/select_contacts_to_add_screen.dart';
import 'package:stellar_chat/View/contact/show_contact/show_contacts_screen.dart';
import 'package:stellar_chat/View/profile/qr/qr_screen.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/utils/colors.dart';

import '../../../../../../Settings/SColors.dart';
import '../../../../../../Settings/SSvgs.dart';
import '../../../../../../widgets/custom_popup_menu_item.dart';

class ChatHomeAppbarWidget extends StatelessWidget {
  const ChatHomeAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Container(
      height: 100,
      width: double.infinity,
      color: themeController.isDarkTheme.value
          ? const Color.fromRGBO(50, 50, 50, 1)
          : SColors.color12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: SvgPicture.string(themeController.isDarkTheme.value
                ? """<svg width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_1505_4334)">
<path d="M45 22.5C45 10.074 34.926 0 22.5 0C10.074 0 0 10.074 0 22.5C0 34.926 10.074 45 22.5 45C26.3913 45 30.0505 44.0108 33.2453 42.2746H39.2715C40.71 42.2746 41.8758 41.1087 41.8758 39.6703V33.9418C43.8594 30.5905 45 26.679 45 22.5Z" fill="#9FC4E8"/>
<path d="M31.2171 12.5117H14.3345C13.0328 12.5117 11.9775 13.567 11.9775 14.8687C11.9775 16.1705 13.0328 17.2257 14.3345 17.2257H31.2171C32.5188 17.2257 33.5741 16.1705 33.5741 14.8687C33.5741 13.567 32.5188 12.5117 31.2171 12.5117Z" fill="#323232"/>
<path d="M31.2168 20.8447H12.0328C10.731 20.8447 9.67578 21.9 9.67578 23.2017C9.67578 24.5035 10.731 25.5587 12.0328 25.5587H31.2168C32.5186 25.5587 33.5738 24.5035 33.5738 23.2017C33.5738 21.9 32.5186 20.8447 31.2168 20.8447Z" fill="#323232"/>
<path d="M31.2167 29.1719H21.5162C20.2144 29.1719 19.1592 30.2271 19.1592 31.5289C19.1592 32.8306 20.2144 33.8859 21.5162 33.8859H31.2167C32.5185 33.8859 33.5737 32.8306 33.5737 31.5289C33.5737 30.2271 32.5185 29.1719 31.2167 29.1719Z" fill="#323232"/>
</g>
<defs>
<clipPath id="clip0_1505_4334">
<rect width="45" height="45" fill="white"/>
</clipPath>
</defs>
</svg>
"""
                : """<svg width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_712_1046)">
<path d="M45 22.5C45 10.074 34.926 0 22.5 0C10.074 0 0 10.074 0 22.5C0 34.926 10.074 45 22.5 45C26.3913 45 30.0505 44.0108 33.2453 42.2746H39.2715C40.71 42.2746 41.8758 41.1087 41.8758 39.6703V33.9418C43.8594 30.5905 45 26.679 45 22.5Z" fill="#99C7FF"/>
<path d="M31.2164 12.5117H14.3338C13.0321 12.5117 11.9768 13.567 11.9768 14.8687C11.9768 16.1705 13.0321 17.2257 14.3338 17.2257H31.2164C32.5181 17.2257 33.5734 16.1705 33.5734 14.8687C33.5734 13.567 32.5181 12.5117 31.2164 12.5117Z" fill="#00338E"/>
<path d="M31.2163 20.8447H12.0323C10.7306 20.8447 9.67529 21.9 9.67529 23.2017C9.67529 24.5035 10.7306 25.5587 12.0323 25.5587H31.2163C32.5181 25.5587 33.5733 24.5035 33.5733 23.2017C33.5733 21.9 32.5181 20.8447 31.2163 20.8447Z" fill="#00338E"/>
<path d="M31.2163 29.1719H21.5158C20.2141 29.1719 19.1588 30.2271 19.1588 31.5289C19.1588 32.8306 20.2141 33.8859 21.5158 33.8859H31.2163C32.5181 33.8859 33.5733 32.8306 33.5733 31.5289C33.5733 30.2271 32.5181 29.1719 31.2163 29.1719Z" fill="#00338E"/>
</g>
<defs>
<clipPath id="clip0_712_1046">
<rect width="45" height="45" fill="white"/>
</clipPath>
</defs>
</svg>
"""),
          ),
          InkWell(
            onTap: () {},
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                CustomPopupMenuItem(
                  value: 'new_chat',
                  icon: SvgPicture.asset(
                    SSvgs.sv17,
                    width: 20,
                    height: 20,
                  ),
                  ontap: () {
                    Get.back();
                    Get.to(() => const ShowContactsScreen());
                  },
                  text: 'New Chat',
                ),
                CustomPopupMenuItem(
                  value: 'add_contact',
                  icon: SvgPicture.asset(
                    SSvgs.sv14,
                    width: 20,
                    height: 20,
                  ),
                  ontap: () {
                    // print("tapped");
                    // Navigator.push(
                    //     context,
                    //     CupertinoPageRoute(
                    //         builder: (builder) => AddContactUi()));
                    Get.back();
                    Get.to(() => const AddContactUi(), fullscreenDialog: false);
                  },
                  text: 'Add Contact',
                ),
                CustomPopupMenuItem(
                  value: 'scan',
                  icon: SvgPicture.asset(
                    SSvgs.sv16,
                    width: 20,
                    height: 20,
                  ),
                  ontap: () {
                    Get.back();
                    Get.to(
                      () => const QRScreen(
                        isFromSettings: false,
                      ),
                    );
                  },
                  text: 'Scan',
                ),
                CustomPopupMenuItem(
                  value: 'money',
                  icon: SvgPicture.asset(
                    SSvgs.sv15,
                    width: 20,
                    height: 20,
                  ),
                  ontap: () {},
                  text: 'Money',
                ),
              ],
              onSelected: (String choice) {
                // switch (choice) {
                //   case 'new_chat':
                //     Navigator.pushNamed(context, NewChatUi.routeName);
                //     break;
                //   case 'scan':
                //     Navigator.pushNamed(context, TakeScanUi.routeName);
                //     break;
                //   case 'money':
                //     Navigator.pushNamed(
                //         context, MoneyPaymentUi.routeName);
                //     break;
                // }
              },
              icon: SvgPicture.asset(SSvgs.sv08,
                  width: 20,
                  height: 20,
                  color: themeController.isDarkTheme.value
                      ? Color.fromRGBO(193, 193, 193, 1)
                      : secondaryColor),
              color: SColors.color11,
            ),
          ),
        ],
      ),
    );
  }
}
