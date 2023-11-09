import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class SignUpTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isBirthday;
  final String? Function(String? val)? validator;
  final Function(String? val)? onSaved;
  final Function(String val)? onChanged;

  const SignUpTextField({
    Key? key,
    this.isPassword = false,
    this.isBirthday = false,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
     this.hintText,
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
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
        height: containerHeight == 50 ? 4.8 : 1.0,
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
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
    );
  }

  Widget textField(TextEditingController controller) {
    DateTime selectedDate = DateTime.now();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          controller.text =
              "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
        });
      }
    }

    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: widget.isBirthday
          ? Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                  readOnly: true,
                  onTap: () => selectDate(context),
                  decoration:
                  buildInputDecoration(),
                  controller: controller),
            )
          : TextFormField(
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              validator:  (val) {
                final error = widget.validator!(val);
                if (error != null) {
                  _increaseContainerHeight();
                } else {
                  _resetContainerHeight();
                }
                return error;
              },
              obscureText: widget.isPassword,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: textField(widget.controller),
    );
  }
}
