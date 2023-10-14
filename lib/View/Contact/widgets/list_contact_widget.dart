import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

import '../../../controllers/contacts_controller.dart';
import '../../../models/api_models/get_contacts_model.dart';
import '../../chat/chat_screen/chat_screen.dart';

class ListContactsWidget extends StatelessWidget {
  const ListContactsWidget({
    super.key,
    required this.contactsController,
  });

  final ContactsController contactsController;

  @override
  Widget build(BuildContext context) {
    print(contactsController.phoneNumberUserList.length);
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final themeController = Get.find<ThemeController>();
          Contact data = contactsController.phoneNumberUserList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListTile(
              onTap: () async {
                Get.to(() => PrivateChatScreen(
                    imageUrl: data.strProfileUrl,
                    fullName: data.strFullName,
                    chatId: data.id));
              },
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      data.strProfileUrl.isEmpty
                          ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                          : data.strProfileUrl,
                    ),
                  ),
                ),
              ),
              title: Obx(() => Text(
                    data.strFullName,
                    style: TextStyle(
                      color: themeController.isDarkTheme.value
                          ? Colors.white
                          : SColors.color3,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              subtitle: Obx(() => Text(
                    data.strMobileNo,
                    style: TextStyle(
                      color: themeController.isDarkTheme.value
                          ? Colors.white
                          : Colors.black,
                    ),
                  )),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
            ),
        itemCount: contactsController.phoneNumberUserList.length);
  }
}
