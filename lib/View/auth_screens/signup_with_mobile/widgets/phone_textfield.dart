import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/auth_screens/LoginWithMobile/widgets/login_phone_textfield.dart';

class PhoneTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;

  const PhoneTextField({
    Key? key,
    required this.keyboardType,
    required this.hintText,
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
  double containerHeight = 35;

  void _increaseContainerHeight() {
    setState(() {
      containerHeight = 50;
    });
  }

  void _resetContainerHeight() {
    setState(() {
      containerHeight = 35;
    });
  }


  InputDecoration buildInputDecoration({double contentVerticalPadding = 15}) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: TextStyle(
        color: SColors.color9,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: containerHeight == 50 ? 4.5 : 1.0,
      ),
      border: InputBorder.none,
      contentPadding:  EdgeInsets.symmetric(vertical: contentVerticalPadding, horizontal: 15),
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
      prefixIcon:Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                final code = await countryPicker.showPicker(context: context);
                setState(() {
                  publiccountryCode =code;
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(publiccountryCode?.dialCode ?? "+91",style: TextStyle(color: Colors.black),),
                  ),
                GestureDetector(
                    onTap: () async {
                      final code =
                      await countryPicker.showPicker(context: context);
                      setState(() {
                        publiccountryCode = code;
                      });
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: SColors.color3,
                      size: 28,
                    )),

                  containerHeight == 50 ?  Padding(
                    padding: EdgeInsets.all(7),
                    child: VerticalDivider(thickness: 2, color: Colors.grey.withOpacity(0.4),),
                  ) :  VerticalDivider(thickness: 2, color:Colors.grey.withOpacity(0.4),
                  ),
                // const SizedBox(width: 5,),
              ],
            ),
            ),
          ],
        ),
      ));
  }


  Widget textField(TextEditingController controller) {
    return GestureDetector(
      child: Container(
        height:containerHeight,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child:  TextFormField(
          maxLines: 1,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: (val) {
            final error = widget.validator!(val);
            if (error != null) {
              _increaseContainerHeight();
            } else {
              _resetContainerHeight();
            }
            return error;
          },
          controller: controller,
          keyboardType: widget.keyboardType,
          cursorColor: Colors.black,
          style: TextStyle(
            color: SColors.color3,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),

          autocorrect: true,
          decoration:  buildInputDecoration(contentVerticalPadding: containerHeight == 50 ? 11 : 0,),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6),
      child: textField(widget.controller),
    );
  }
}

