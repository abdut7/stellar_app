import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/Contact/add_contact/add_contact.dart';
import 'package:base_project/View/Contact/create_group/create_group_screen.dart';
import 'package:base_project/View/Contact/show_contact/widget/show_contact_tile.dart';
import 'package:base_project/View/Contact/widgets/list_contact_widget.dart';
import 'package:base_project/services/api_services/contacts_service.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/contacts_controller.dart';

class ShowContactsScreen extends StatefulWidget {
  const ShowContactsScreen({super.key});

  @override
  State<ShowContactsScreen> createState() => _ShowContactsScreenState();
}

class _ShowContactsScreenState extends State<ShowContactsScreen> {
  @override
  void initState() {
    ContactServiceApi.getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: SColors.color12,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            SSvgs.appLogo,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Contact',
                style: TextStyle(
                  color: SColors.color11,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              '675 Contacts',
              style: TextStyle(
                color: SColors.color11,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            color: SColors.color11, // Change this to your desired color
            onSelected: (value) {
              // Handle the option selected
              switch (value) {
                case 1:
                  // Option 1 action
                  break;
                case 2:
                  // Option 2 action
                  break;
                case 3:
                  // Option 3 action
                  break;
                case 4:
                  // Option 4 action
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  'Invite Friend',
                  style: TextStyle(color: SColors.color12),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text(
                  'Contacts',
                  style: TextStyle(color: SColors.color12),
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Text(
                  'Refresh',
                  style: TextStyle(color: SColors.color12),
                ),
              ),
              PopupMenuItem<int>(
                value: 4,
                child: Text(
                  'Help',
                  style: TextStyle(color: SColors.color12),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const SearchTextField(),
            GestureDetector(
              onTap: () {
                Get.to(() => const CreateGroupScreen());
              },
              child: Tile(
                svgAsset: SSvgs.sv20,
                assetColor: SColors.color12,
                circleAvatarBackgroundColor: SColors.color4,
                title: 'New Group',
              ),
            ),
            GestureDetector(
              onTap: () {
                //
                Get.to(() => const AddContactUi());
              },
              child: Tile(
                svgAsset: SSvgs.sv06,
                assetColor: SColors.color4,
                circleAvatarBackgroundColor: SColors.color12,
                title: 'New Contact',
                trailingIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.qr_code,
                      color: SColors.color3,
                    )),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Contacts On Phone',
                style: TextStyle(
                  color: SColors.color8,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => contactsController.isGetContactLoading.value ||
                    contactsController.getContactsModel.value == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : contactsController.getContactsModel.value!.arrList.isEmpty
                    ? const Center(
                        child: Text("No Contacts added add now"),
                      )
                    : ListContactsWidget(
                        contactsController: contactsController)),
          ],
        ),
      ),
    );
  }
}
