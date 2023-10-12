import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class ProceedToPaymentButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const ProceedToPaymentButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 40,
          decoration: BoxDecoration(
            color: SColors.color19,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
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
