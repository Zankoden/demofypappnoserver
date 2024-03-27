import 'package:flutter/material.dart';

class CustomColors {
  static Color? backgroundColor = Colors.grey[100]; // Light Gray or Off-White
  static Color appBarColor = Colors.blue; // Soft Blue
  static Color? textColor = Colors.grey[800]; // Dark Gray or Charcoal
  static const Color iconColor = Colors.grey; // Soft Gray for icons
  static Color? buttonColor =
      Colors.blue[700]; // Darker shade of blue for buttons
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: CustomColors.backgroundColor,
    appBarTheme: AppBarTheme(
      color: CustomColors.appBarColor,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: CustomColors.textColor),
    ),
    // Add more theme customization as needed
  );
}
