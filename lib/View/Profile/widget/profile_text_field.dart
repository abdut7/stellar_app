import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  final String head;
  final TextInputType keyboardType;
  final int? maxLines;
  final TextEditingController controller;

  const ProfileTextField({
    Key? key,
    required this.head,
    required this.keyboardType,
    this.maxLines,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  Widget textFieldHeading({String? headingText}) {
    return Text(
      headingText!,
      style: TextStyle(
        fontSize: 14,
        color: SColors.color3,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  InputDecoration buildInputDecoration(String hText) {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget textField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 28,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),color: Colors.grey.withOpacity(0.1)),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: SColors.color8,
        style: TextStyle(
          color: SColors.color3,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          letterSpacing: 0.2,
        ),
        autocorrect: true,
        maxLines: widget.maxLines,
        decoration: buildInputDecoration(widget.head),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: 70,
              child: textFieldHeading(headingText: widget.head),
            ),
          ),
          Expanded(
            child: textField(),
          ),
        ],
      ),
    );
  }
}
