import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

class LocationSearchField extends StatefulWidget {
  const LocationSearchField({Key? key}) : super(key: key);

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}

class _LocationSearchFieldState extends State<LocationSearchField> {
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
          hintText: 'Search Location',
          hintStyle: TextStyle(
            color: SColors.color9,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: SColors.color3, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}
