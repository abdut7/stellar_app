import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class EditProfileTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String labelText;

  const EditProfileTextField({
    Key? key,
    required this.keyboardType,
    this.suffixIcon,
    required this.labelText,
  }) : super(key: key);

  @override
  State<EditProfileTextField> createState() => _EditProfileTextFieldState();
}

class _EditProfileTextFieldState extends State<EditProfileTextField> {
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      filled: true,
      fillColor: SColors.color14,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      suffixIcon: widget.suffixIcon,
    );
  }

  Widget textField() {
    return Container(
      child: TextFormField(
        keyboardType: widget.keyboardType,
        cursorColor: SColors.color3,
        style: TextStyle(
          color: SColors.color3,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.50,
        ),
        autocorrect: true,
        decoration: buildInputDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Container(
            width: 70,
            child: Text(
              widget.labelText,
              style:  TextStyle(
                color: SColors.color3,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: textField(),
            ),
          ),
        ],
      ),
    );
  }
}
