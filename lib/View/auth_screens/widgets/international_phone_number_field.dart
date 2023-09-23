import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InternationalPhoneNumberFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const InternationalPhoneNumberFieldWidget(
      {super.key, required this.controller});
  @override
  _InternationalPhoneNumberFieldWidgetState createState() =>
      _InternationalPhoneNumberFieldWidgetState();
}

class _InternationalPhoneNumberFieldWidgetState
    extends State<InternationalPhoneNumberFieldWidget> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // Handle changes to the phone number here
        setState(() {
          phoneNumber = number.phoneNumber!;
        });
      },
      initialValue: PhoneNumber(isoCode: 'US'), // Initial country code
      inputDecoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(),
      ),
    );
  }
}
