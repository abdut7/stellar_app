import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/view/chat/widgets/sent_contact/contact_detail_screen.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class PickContactFromPhoneToSent extends StatefulWidget {
  final String chatId;
  final bool isGroup;

  const PickContactFromPhoneToSent(
      {super.key, required this.chatId, required this.isGroup});
  @override
  // ignore: library_private_types_in_public_api
  _PickContactFromPhoneToSentState createState() =>
      _PickContactFromPhoneToSentState();
}

class _PickContactFromPhoneToSentState
    extends State<PickContactFromPhoneToSent> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  List<Contact> _selectedContacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
      _filteredContacts = contacts.toList();
    });
  }

  void _toggleContactSelection(Contact contact) {
    setState(() {
      if (_selectedContacts.contains(contact)) {
        _selectedContacts.remove(contact);
      } else {
        _selectedContacts.add(contact);
      }
    });
  }

  void _filterContacts(String query) {
    final filteredContacts = _contacts.where((contact) {
      final name = contact.displayName?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
    setState(() {
      _filteredContacts = filteredContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Scaffold(
      backgroundColor:
          themeController.isDarkTheme.value ? SColors.darkmode : SColors.color4,
      appBar: AppBar(
        backgroundColor: themeController.isDarkTheme.value
            ? SColors.appbarbgInDark
            : SColors.color12,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          'Contacts',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            color: themeController.isDarkTheme.value
                ? SColors.appbarTitleInDark
                : SColors.color11,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SvgPicture.asset(SSvgs.appLogo),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Send',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: themeController.isDarkTheme.value
                      ? SColors.appbarTitleInDark
                      : SColors.color11,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: SizedBox(
              height: 35,
              child: TextFormField(
                  cursorColor: SColors.color12,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      color: SColors.color9,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: SColors.color3,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: _filterContacts),
            ),
          ),
          _filteredContacts.isEmpty
              ? const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Fetching contact will take some time,\nPlease wait",
                      style: TextStyle(
                        fontFamily: 'Inter',
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                  itemCount: _filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = _filteredContacts[index];

                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ListTile(
                          onTap: () {
                            if (contact.phones != null) {
                              Get.to(
                                () => ContactDetailsScreen(
                                  chatId: widget.chatId,
                                  isGroup: widget.isGroup,
                                  contact: contact,
                                ),
                              );
                            }
                          },
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                              ),
                            ),
                          ),
                          subtitle: contact.phones == null ||
                                  contact.phones!.isEmpty
                              ? null
                              : Text(
                                  contact.phones!.first.value ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: themeController.isDarkTheme.value
                                          ? SColors.color4
                                          : SColors.color3,
                                      fontSize: 12
                                      // fontSize: 17,
                                      // fontWeight: FontWeight.w500,
                                      ),
                                ),
                          title: Text(
                            contact.displayName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: themeController.isDarkTheme.value
                                  ? SColors.color4
                                  : SColors.color3,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ));
                  },
                ))
        ],
      ),
    );
  }
}
