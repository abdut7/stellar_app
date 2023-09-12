import 'package:flutter/material.dart';
class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget icon;
  final String text;

  CustomPopupMenuItem({
    required T value,
    required this.icon,
    required this.text,
  }) : super(
    value: value,
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: icon,
        ),
        Text(text),
      ],
    ),
  );
}