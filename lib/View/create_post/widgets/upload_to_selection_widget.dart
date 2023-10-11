import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/create_post/create_post_home.dart';

class UploadToSelectionWidget extends StatelessWidget {
  UploadToSelectionWidget({
    super.key,
    required this.selectedValue,
    required this.value,
    required this.onTap,
  });

  final UploadTo selectedValue;
  final UploadTo value;
  final Function(UploadTo val) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(value);
      },
      child: Text(
        value.name.capitalize!,
        style: TextStyle(
            color: selectedValue == value
                ? Color.fromRGBO(0, 51, 142, 1)
                : Color.fromRGBO(255, 255, 255, 1)),
      ),
    );
  }
}
