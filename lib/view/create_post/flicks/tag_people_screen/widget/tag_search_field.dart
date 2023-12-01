import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

class TagSearchField extends StatefulWidget {
  const TagSearchField({Key? key}) : super(key: key);

  @override
  State<TagSearchField> createState() => _TagSearchFieldState();
}

class _TagSearchFieldState extends State<TagSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextFormField(
        onChanged: (value) {
          FliqServices.searchUserInTag(search: value);
        },
        cursorColor: SColors.color12,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: 'Search Users',
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
        style:
            TextStyle(fontFamily: 'Inter', color: SColors.color3, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}
