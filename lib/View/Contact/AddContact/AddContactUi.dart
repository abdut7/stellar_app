import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/Contact/AddContact/select_contacts_to_add_screen.dart';
import 'package:base_project/widgets/custom_listtile.dart';
import 'package:base_project/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
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
    return AppBar(
      title: Text(
        'ADD CONTACTS',
        style: TextStyle(
          color: SColors.color3,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.cancel,
          color: SColors.color3,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildStellarId(String text, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            id,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          const SearchTextField(),
          const SizedBox(height: 20),
          _buildStellarId('MY STELLAR CHAT ID :', 'XXXX_XXXXXXX_XXX'),
          const SizedBox(
            height: 40,
          ),
          CustomListTile(
            text: 'Invite Friends',
            subtitle: 'Invite friends to chat using the app!',
            onPressed: () {},
          ),
          CustomListTile(
            text: 'Friends Radar',
            subtitle: 'Quickly add friends nearby',
            onPressed: () {},
          ),
          CustomListTile(
            text: 'Join Private Group',
            subtitle: 'Join a group with friends nearby',
            onPressed: () {},
          ),
          CustomListTile(
            text: 'Use QR Code',
            subtitle: 'Scan a friends Code',
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SelectContacts(controller: contactsController));
            },
            child: CustomListTile(
              text: 'Mobile Contact',
              subtitle: 'Add from mobile contact',
              onPressed: () {},
            ),
          ),
          CustomListTile(
            text: 'Official Accounts',
            subtitle: 'Get more services and information',
            onPressed: () {},
          ),
          CustomListTile(
            text: 'Stellar Contacts',
            subtitle: 'Find stellar user by mobile number',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
