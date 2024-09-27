import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

const basicShadow = BoxShadow(
  color: Colors.black,
  spreadRadius: -5,
  offset: Offset(0, 10),
);

const compactShadow = BoxShadow(
  color: Colors.black,
  spreadRadius: -3,
  offset: Offset(-7, -7),
);

final customTheme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'LinikSans',
      letterSpacing: 0.4,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'LinikSans',
    ),
  ),
  scaffoldBackgroundColor: backgroundColor,
);

// Currently just an example of how to extend the default theme
extension CustomTextStyles on TextTheme {
  TextStyle get customTextStyle =>
      const TextStyle(fontSize: 16, fontStyle: FontStyle.italic);
}
