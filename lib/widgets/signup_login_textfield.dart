import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class SignUpLoginTextField extends StatefulWidget {
  final String head;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const SignUpLoginTextField({
    Key? key,
    required this.head,
    required this.keyboardType,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<SignUpLoginTextField> createState() => _SignUpLoginTextFieldState();
}

class _SignUpLoginTextFieldState extends State<SignUpLoginTextField> {
  Widget textFieldHeading({String? headingText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Text(
        headingText!,
        style: TextStyle(
          fontFamily: 'Inter',
          color: SColors.color3,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.30,
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      filled: true,
      //hintText: hText,
      hintStyle: TextStyle(
        fontFamily: 'Inter',
        color: SColors.color3,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.20,
      ),
      fillColor: SColors.color4,
      focusColor: SColors.color4,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: SColors.color4,
              blurRadius: 55,
              offset: Offset(0, 14),
              spreadRadius: -30,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: widget.keyboardType,
          cursorColor: SColors.color11,
          style: TextStyle(
            fontFamily: 'Inter',
            color: SColors.color3,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.50,
          ),
          autocorrect: true,
          decoration: buildInputDecoration(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldHeading(headingText: widget.head),
        const SizedBox(height: 5),
        textField(),
        const SizedBox(height: 15),
      ],
    );
  }
}
