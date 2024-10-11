import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/theme/colors.dart';

final customTheme = ThemeData(
  useMaterial3: true,
  cardColor: cardColor,
  primaryColor: primaryColors['red'],
  navigationBarTheme: const NavigationBarThemeData(
    elevation: 0,
    backgroundColor: cardColor,
  ),
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
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
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
