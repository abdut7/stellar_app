import 'package:flutter/material.dart';
class AmountDisplayTextField extends StatefulWidget {
  const AmountDisplayTextField({Key? key}) : super(key: key);

  @override
  State<AmountDisplayTextField> createState() => _AmountDisplayTextFieldState();
}

class _AmountDisplayTextFieldState extends State<AmountDisplayTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: const TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.black, fontSize: 70, fontWeight: FontWeight.w600,),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: '0.00',
          hintStyle: TextStyle(color: Colors.black, fontSize: 70, fontWeight: FontWeight.w700,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
