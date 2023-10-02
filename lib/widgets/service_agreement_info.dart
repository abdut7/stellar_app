import 'package:stellar_chat/Settings/SColors.dart';
import 'package:flutter/material.dart';

class ServiceAgreement extends StatefulWidget {
  @override
  _ServiceAgreementState createState() => _ServiceAgreementState();
}

class _ServiceAgreementState extends State<ServiceAgreement> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'QUICK PAY NOT ENABLED. AFTER ENABLING,\nDISPLAY CODE TO CASHIER TO QUICK PAY',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio(
              value: isSelected,
              groupValue: true,
              onChanged: (bool? value) {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'YOU HAVE READ AND AGREE TO THE\n',
                    style: TextStyle(
                      color: SColors.color9,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'PAYMENT USED SERVICE AGREEMENT',
                    style: TextStyle(
                      color: SColors.color9,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
