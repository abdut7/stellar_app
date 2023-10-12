import 'package:flutter/material.dart';

class EnterCardDetailsTextField extends StatefulWidget {
  final String headText;
  final TextInputType keyboardInputType;

  EnterCardDetailsTextField({
    required this.headText,
    required this.keyboardInputType,
  });

  @override
  _EnterCardDetailsTextFieldState createState() => _EnterCardDetailsTextFieldState();
}

class _EnterCardDetailsTextFieldState extends State<EnterCardDetailsTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          keyboardType: widget.keyboardInputType,
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 97, 14, 1)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 97, 14, 1)),
            ),
          ),
          style: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500,),
          cursorColor: Colors.black,
        ),
      ],
    );
  }
}
