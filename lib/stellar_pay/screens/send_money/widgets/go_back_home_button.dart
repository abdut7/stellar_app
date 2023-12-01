import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class GoBackHomeButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onTap;

  const GoBackHomeButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GoBackHomeButton> createState() => _GoBackHomeButtonState();
}

class _GoBackHomeButtonState extends State<GoBackHomeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: Get.width * 0.7,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: SColors.color19),
          color: SColors.color25,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
