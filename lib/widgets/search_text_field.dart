import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';
class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      child: TextFormField(
        cursorColor: SColors.color12,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: 'SEARCH',
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
