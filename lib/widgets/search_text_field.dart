import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/services/api_services/chat_history_service.dart';
import 'package:stellar_chat/services/api_services/contacts_service.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key, this.isFromContacts = false})
      : super(key: key);
  final bool isFromContacts;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        cursorColor: SColors.color12,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Color.fromRGBO(171, 169, 169, 1),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          style: TextStyle(color: SColors.color3, fontSize: 15),
          textAlign: TextAlign.center,
          onChanged: (val) {
            if (widget.isFromContacts) {
              if (val.isEmpty) {
                ContactServiceApi.getContacts();
              } else {
                ContactServiceApi.searchContacts(val);
              }
            } else {
              if (val.isEmpty) {
                ChatHistoryServiceApi.getChatHistory();
              } else {
                ChatHistoryServiceApi.getChatHistorySearch(val: val);
              }
            }
          },
        ),
        style: TextStyle(color: SColors.color3, fontSize: 15),
        // textAlign: TextAlign.center,
        onChanged: (val) {
          if (widget.isFromContacts) {
            if (val.isEmpty) {
              ContactServiceApi.getContacts();
            } else {
              ContactServiceApi.searchContacts(val);
            }
          } else {
            if (val.isEmpty) {
              ChatHistoryServiceApi.getChatHistory();
            } else {
              ChatHistoryServiceApi.getChatHistorySearch(val: val);
            }
          }
        },
      ),
    );
  }
}
