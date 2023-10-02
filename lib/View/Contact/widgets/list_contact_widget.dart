import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Contact data = contactsController.phoneNumberUserList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () async {
                Get.to(() => PrivateChatScreen(
                    fullName: data.strFullName, chatId: data.id));
              },
              leading: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(data.strProfileUrl.isEmpty
                    ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                    : data.strProfileUrl),
              ),
              title: Text(
                data.strFullName,
                style: TextStyle(
                  color: SColors.color3,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text(data.strMobileNo),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
            ),
        itemCount: contactsController.phoneNumberUserList.length);
  }
}
