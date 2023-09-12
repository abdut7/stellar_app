import 'package:base_project/Settings/SColors.dart';
import 'package:flutter/material.dart';

TextTheme _textTheme = const TextTheme();

ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  textTheme: _textTheme,
  hoverColor: Colors.transparent,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent,elevation: 0)
);
