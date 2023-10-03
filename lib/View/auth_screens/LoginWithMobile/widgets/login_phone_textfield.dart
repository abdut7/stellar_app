import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class LoginPhoneTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;

  const LoginPhoneTextField({
    Key? key,
    required this.keyboardType,
    required this.labelText,
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  State<LoginPhoneTextField> createState() => _LoginPhoneTextFieldState();
}

class _LoginPhoneTextFieldState extends State<LoginPhoneTextField> {
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
          padding: EdgeInsets.symmetric(horizontal: 0,vertical: 6),
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                    child: Text(countryCode?.dialCode ?? "+971",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300,
                      letterSpacing: -0.18,
                    ),),
                    decoration: BoxDecoration(color: SColors.color4),
                  ),
                  GestureDetector(
                      onTap: () async {
                        final code = await countryPicker.showPicker(
                            context: context);
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Icon(Icons.keyboard_arrow_down,color: SColors.color3,size: 25,)),

                  Container(height: 25, width: 2, color: Colors.grey.withOpacity(0.5),)
                ],
              ),
            ],
          ),
        )
    );
  }


  Widget textField(TextEditingController controller) {
    return GestureDetector(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              color: SColors.color3,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          textField(widget.controller),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
