import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpWithPhoneButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? prefixIcon;
  final String? svgAssetPath;
  final void Function() onPressed;

  SignUpWithPhoneButton({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.prefixIcon,
    this.svgAssetPath,
    required this.onPressed,
    required this.foregroundColor,
  });

  @override
  _SignUpWithPhoneButtonState createState() => _SignUpWithPhoneButtonState();
}

class _SignUpWithPhoneButtonState extends State<SignUpWithPhoneButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 52,
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.backgroundColor,
                foregroundColor: widget.foregroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Colors.black), // Add this line for border
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (widget.prefixIcon != null)
                      Icon(
                        widget.prefixIcon,
                        size: 20,
                        color: Colors.black,
                      )
                    else if (widget.svgAssetPath != null)
                      SvgPicture.asset(
                        widget.svgAssetPath!,
                        width: 20,
                        height: 20,
                      ),
                    Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: widget.textColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
