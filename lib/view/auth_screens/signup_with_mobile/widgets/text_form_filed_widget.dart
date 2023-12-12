import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.size,
    this.validator,
    required this.hintText,
    required this.controller,
    required this.inputType,
  });
  final Size size;
  final String? Function(String? val)? validator;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                controller: controller,
                validator: (value) {
                  final error = validator!(value);
                  return error;
                },
                keyboardType: inputType,
                obscureText: inputType == TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color(0xFFABA8A8),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter"),
                    hintText: hintText,
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
