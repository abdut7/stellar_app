import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/chat/widgets/sent_contact/contact_detail_screen.dart';

class PickContactFromPhoneToSent extends StatefulWidget {
  final String chatId;
  final bool isGroup;

  const PickContactFromPhoneToSent(
      {super.key, required this.chatId, required this.isGroup});
  @override
  _PickContactFromPhoneToSentState createState() =>
      _PickContactFromPhoneToSentState();
}

class _PickContactFromPhoneToSentState
    extends State<PickContactFromPhoneToSent> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SColors.color12,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: const Text(
          'Contacts',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9FC4E8),
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
            padding: const EdgeInsets.only(top: 40,right: 20),
            child: GestureDetector(
              onTap: (){

              },
              child: Text(
                'Send',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:SColors.color11,
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
              color: SColors.color9,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: SColors.color3, fontSize: 15),
          textAlign: TextAlign.center,
          onChanged: _filterContacts
        ),
      ),
    ),
          _filteredContacts.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: AlphabetListScrollView(
                    showPreview: true,
                    strList: _filteredContacts
                        .map((contact) => contact.displayName ?? "")
                        .toList(),
                    indexedHeight: (index) => 80,
                    itemBuilder: (context, index) {
                      final contact = _filteredContacts[index];
                      return ListTile(
                        onTap: () {
                          if (contact.phones != null) {
                            Get.to(() => ContactDetailsScreen(
                                  chatId: widget.chatId,
                                  isGroup: widget.isGroup,
                                  contact: contact,
                                ));
                          }
                        },
                        title: Text(contact.displayName ?? ''),
                        // Add more contact information or actions here if needed.
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
