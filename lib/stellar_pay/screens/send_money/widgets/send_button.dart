import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class SendButton extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonText;

  const SendButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  _SendButtonState createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: 41,
          decoration: ShapeDecoration(
            color: SColors.color19,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontFamily: 'Inter',
                color: SColors.color20,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
