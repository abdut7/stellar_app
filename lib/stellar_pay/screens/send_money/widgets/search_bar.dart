import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/services/api_services/chat_history_service.dart';
import 'package:stellar_chat/services/api_services/contacts_service.dart';
import 'package:flutter/material.dart';

class SearchBarTextfield extends StatefulWidget {
  const SearchBarTextfield(
      {Key? key, this.isFromContacts = false, required this.hintText})
      : super(key: key);
  final bool isFromContacts;
  final String hintText;

  @override
  State<SearchBarTextfield> createState() => _SearchBarTextfieldState();
}

class _SearchBarTextfieldState extends State<SearchBarTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          cursorColor: SColors.color12,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: 'Inter',
              color: SColors.color9,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
              fontFamily: 'Inter', color: SColors.color3, fontSize: 15),
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
      ),
    );
  }
}
