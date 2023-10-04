import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
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
        title: const Text('Phone Contacts'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterContacts,
              decoration: const InputDecoration(
                hintText: 'Search contacts...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          _filteredContacts.isEmpty
              ? Center(
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
