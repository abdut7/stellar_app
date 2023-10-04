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
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: TextStyle(
        color: SColors.color9,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
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
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: widget.isBirthday
          ? Container(
<<<<<<< HEAD
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                  readOnly: true, // Prevent manual editing
                  onTap: () => selectDate(context), // Show date picker on tap
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    // labelText: 'Select Date',
                    labelStyle: TextStyle(
                      color: Color(0xFFABA8A8),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Choose a date',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: controller),
            )
=======
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
            readOnly: true, // Prevent manual editing
            onTap: () => selectDate(context), // Show date picker on tap
            decoration: buildInputDecoration(),

            // const InputDecoration(
            //   border: InputBorder.none,
            //   hintText: 'Select Date',
            //   hintStyle: TextStyle(color: Color(0xFFABA8A8), fontSize: 10, fontWeight: FontWeight.w600,),
            //   prefixIcon: Icon(Icons.calendar_today),
            // ),
            controller: controller),
      )
>>>>>>> 27d1740fd79c0af69f389a20d29507e6fd09e5d6
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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: textField(widget.controller),
    );
  }
}
