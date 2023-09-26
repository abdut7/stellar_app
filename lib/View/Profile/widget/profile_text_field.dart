import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  final String head;
  final TextInputType keyboardType;
  final int? maxLines;

  const ProfileTextField({
    Key? key,
    required this.head,
    required this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  Widget textFieldHeading({String? headingText}) {
    return Text(
      headingText!,
      style: TextStyle(
        fontSize: 13,
        color: SColors.color3,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  InputDecoration buildInputDecoration(String hText) {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding:  EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
    return TextFormField(
      keyboardType: widget.keyboardType,
      cursorColor: SColors.color8,
      style: TextStyle(
        color: SColors.color3,
        fontWeight: FontWeight.w500,
        fontSize: 17,
        letterSpacing: 0.2,
      ),
      autocorrect: true,
      maxLines: widget.maxLines,
      decoration: buildInputDecoration(widget.head),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 100,
              child: textFieldHeading(headingText: widget.head),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: textField(),
            ),
          ),
        ],
      ),
    )

    ;
  }
}
