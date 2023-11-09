import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';
import 'package:stellar_chat/services/socket_service/group_chat_service.dart';
import 'package:stellar_chat/services/socket_service/private_chat_service.dart';
import 'package:stellar_chat/utils/colors.dart';

class ContactDetailsScreen extends StatelessWidget {
  final Contact contact;
  final String chatId;
  final bool isGroup;

  ContactDetailsScreen(
      {required this.contact, required this.chatId, required this.isGroup});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor: themeController.isDarkTheme.value
          ?  SColors.darkmode
          : SColors.color4,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeController.isDarkTheme.value
            ?  SColors.appbarbgInDark
            : SColors.color12,
        title: Text(
          'Contact Details',
          style: TextStyle(
            color: themeController.isDarkTheme.value
                ?  SColors.appbarTitleInDark
                : SColors.color11,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contact.displayName ?? ''),
            const SizedBox(height: 16.0),
            const Text(
              'Phone Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contact.phones!
                  .map(
                    (item) => Text(item.value ?? ''),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      floatingActionButton:

      GestureDetector(
        onTap: () {
          if (isGroup) {
            GroupChatService.sentGroupContactMessage(
                chatId: chatId,
                numbers: contact.phones!
                    .map(
                      (item) => Text(item.value ?? ''),
                    )
                    .toList(),
                name: contact.displayName ?? '');
          } else {
            PrivateChatService.sentPersonalContactMessage(
                chatId: chatId,
                numbers: contact.phones!
                    .map(
                      (item) => item.value ?? '',
                    )
                    .toList(),
                name: contact.displayName ?? '');
          }
          Get.back();
          Get.back();
        },
        child: Container(
          width: Get.width * 0.6,
          height: Get.height * 0.05,
          decoration: BoxDecoration(
              color: themeController.isDarkTheme.value
                  ?  SColors.color26
                  : SColors.color12,

              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "Sent",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
