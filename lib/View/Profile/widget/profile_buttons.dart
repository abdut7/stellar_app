import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  final String buttonText;
  final Function () onPressed;

  const ProfileButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: 32,
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
