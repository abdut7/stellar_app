import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color foregroundColor;
  final Color backgroundColor;
  final void Function() onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text, style: TextStyle(color: widget.textColor,)),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
