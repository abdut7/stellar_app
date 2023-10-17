import 'package:flutter/material.dart';

class ProfileUpdateButton extends StatefulWidget {
  final String buttonText;
  final Function () onPressed;

  const ProfileUpdateButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ProfileUpdateButtonState createState() => _ProfileUpdateButtonState();
}

class _ProfileUpdateButtonState extends State<ProfileUpdateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 51, 142, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(fontSize: 14, color: Color.fromRGBO(159, 196, 232, 1)),
          ),
        ),
      ),
    );
  }
}
