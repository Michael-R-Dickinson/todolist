import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';

final customTheme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: textLight),
  ),
  scaffoldBackgroundColor: backgroundColor,
);

// Currently just an example of how to extend the default theme
extension CustomTextStyles on TextTheme {
  TextStyle get customTextStyle =>
      const TextStyle(fontSize: 16, fontStyle: FontStyle.italic);
}
