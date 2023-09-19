import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/contacts_controller.dart';
import '../../../models/api_models/get_contacts_model.dart';
import '../../../services/token_service/token_service.dart';
import '../../Chat/chat_screen/chat_screen.dart';

class ListContactsWidget extends StatelessWidget {
  const ListContactsWidget({
    super.key,
    required this.contactsController,
  });

  final ContactsController contactsController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          ObjUser data = contactsController
              .getContactsModel.value!.arrList[index].objUser[0];
          return ListTile(
            onTap: () async {
              String? token = await getJwtToken();
              Get.to(() => ChatScreen(
                    user: data,
                    token: token!,
                    chatId: data.id
                  ));
            },
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(data.strProfileUrl),
            ),
            title: Text(data.strFullName),
            subtitle: Text(data.strMobileNo),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: contactsController.getContactsModel.value!.arrList.length);
  }
}
