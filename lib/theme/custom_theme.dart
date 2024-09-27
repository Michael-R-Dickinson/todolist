import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

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
      color: textLight,
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
