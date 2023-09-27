import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/chat/chat_screen/chat_screen.dart';
import 'package:base_project/widgets/appbarContainer.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../controllers/contacts_controller.dart';
import '../../../../../models/api_models/get_contacts_model.dart';
import '../../../../../services/api_services/contacts_service.dart';

class ContactsHomeScreen extends StatefulWidget {
  const ContactsHomeScreen({Key? key}) : super(key: key);

  @override
  State<ContactsHomeScreen> createState() => _ContactsHomeScreenState();
}

class _ContactsHomeScreenState extends State<ContactsHomeScreen> {
  void initState() {
    ContactServiceApi.getContacts();
    super.initState();
  }

  Widget customTile(String text, Function() onTap, String svgAsset) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 35),
          leading: SvgPicture.asset(svgAsset),
          title: Text(
            text,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.find();
    return Scaffold(
      backgroundColor: SColors.color4,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarContainer(labelText: 'Contact'),
                const SearchTextField(),
                const SizedBox(
                  height: 15,
                ),
                customTile(
                  'New Friends',
                  () {},
                  SSvgs.sv19,
                ),
                customTile(
                  'Group Chats',
                  () {},
                  SSvgs.sv20,
                ),
                // customTile(
                //   'Tags',
                //   () {},
                //   SSvgs.sv21,
                // ),
                // customTile(
                //   'File Transfer',
                //   () {},
                //   SSvgs.sv22,
                // ),
                customTile(
                  'Stellar Chat Team',
                  () {},
                  SSvgs.sv23,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Your Contacts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Obx(() => SizedBox(
                  child: contactsController.isGetContactLoading.value ||
                          contactsController.getContactsModel.value == null
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : contactsController
                              .getContactsModel.value!.arrList.isEmpty
                          ? const Center(
                              child: Text("No Contacts added add now"),
                            )
                          : CustomScrollView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              slivers: [
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      ObjUser data = contactsController
                                          .getContactsModel
                                          .value!
                                          .arrList[index]
                                          .objUser[0];
                                      return ListTile(
                                        onTap: () async {
                                          Get.to(() => PrivateChatScreen(
                                              fullName: data.strFullName,
                                              chatId: data.id));
                                        },
                                        leading: CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              NetworkImage(data.strProfileUrl),
                                        ),
                                        title: Text(data.strFullName),
                                        subtitle: Text(data.strMobileNo),
                                      );
                                    },
                                    childCount: contactsController
                                        .getContactsModel.value!.arrList.length,
                                  ),
                                ),
                              ],
                            ),
                ))
          ],
        ),
      ),
    );
  }
}
