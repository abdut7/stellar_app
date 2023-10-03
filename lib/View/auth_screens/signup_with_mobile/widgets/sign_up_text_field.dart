import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class SignUpTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final Widget? prefixIcon; // Added prefixIcon argument
  final Widget? suffixIcon; // Added suffixIcon argument
  final String labelText;
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
    this.prefixIcon, // Added prefixIcon argument
    this.suffixIcon, // Added suffixIcon argument
    required this.labelText,
    required this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      filled: true,
      fillColor: Colors.white, // Changed fillColor to white for visibility
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
      prefixIcon: widget.prefixIcon, // Added prefixIcon
      suffixIcon: widget.suffixIcon, // Added suffixIcon
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
      child: widget.isBirthday
          ? Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
            readOnly: true, // Prevent manual editing
            onTap: () => selectDate(context), // Show date picker on tap
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'Select Date',
              hintText: 'Choose a date',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            controller: controller),
      )
          : TextFormField(
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
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

