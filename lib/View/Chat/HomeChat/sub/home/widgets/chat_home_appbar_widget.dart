import 'package:stellar_chat/View/Contact/add_contact/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/contact/add_contact/scan_qr_code.dart';
import 'package:stellar_chat/View/contact/add_contact/select_contacts_to_add_screen.dart';
import 'package:stellar_chat/View/contact/show_contact/show_contacts_screen.dart';

import '../../../../../../Settings/SColors.dart';
import '../../../../../../Settings/SSvgs.dart';
import '../../../../../../widgets/custom_popup_menu_item.dart';

class ChatHomeAppbarWidget extends StatelessWidget {
  const ChatHomeAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: SColors.color12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: SvgPicture.asset(
              SSvgs.sv07,
            ),
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
                    Get.to(() => QRScannerScreen());
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
              icon: SvgPicture.asset(
                SSvgs.sv08,
                width: 30,
                height: 30,
              ),
              color: SColors.color11,
            ),
          ),
        ],
      ),
    );
  }
}
