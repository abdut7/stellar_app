
import 'package:flutter/material.dart';

class AmountDisplayTextField extends StatefulWidget {
  const AmountDisplayTextField({Key? key}) : super(key: key);

  @override
  State<AmountDisplayTextField> createState() => _AmountDisplayTextFieldState();
}

class _AmountDisplayTextFieldState extends State<AmountDisplayTextField> {
  late FocusNode focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: TextField(
        focusNode: focusNode,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 70,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: isFocused ? '' : '0.00',
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 70,
            fontWeight: FontWeight.w700,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
