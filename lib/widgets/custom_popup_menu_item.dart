import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget icon;
  final String text;
  final VoidCallback ontap;
  final Color textColor;

  CustomPopupMenuItem(
        {
    required this.ontap,
    required this.textColor,
    required T value,
    required this.icon,
    required this.text,
  }) : super(
          value: value,
          child: GestureDetector(
            onTap: ()=>ontap(),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: icon,
                ),
                Text(text,style: TextStyle(
                  color:textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),),
              ],
            ),
          ),
        );
}
