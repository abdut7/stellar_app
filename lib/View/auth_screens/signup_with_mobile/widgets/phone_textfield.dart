import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class PhoneTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;

  const PhoneTextField({
    Key? key,
    required this.keyboardType,
    required this.labelText,
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode?countryCode;

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 6),
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                final code = await countryPicker.showPicker(context: context);
                setState(() {
                  countryCode =code;
                });
              },
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                    child: Text(countryCode?.dialCode ?? "+1",style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(color: SColors.color12),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }


  Widget textField(TextEditingController controller) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child:  TextFormField(
          maxLines: 1,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator,
          controller: controller,
          keyboardType: widget.keyboardType,
          cursorColor: Colors.black,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

          autocorrect: true,
          decoration: buildInputDecoration(),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 55,
            child: Text(
              widget.labelText,
              style: TextStyle(
                color: SColors.color3,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: textField(widget.controller),
            ),
          ),
        ],
      ),
    );
  }
}