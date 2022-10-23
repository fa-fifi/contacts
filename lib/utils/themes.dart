import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      isDense: true,
      fillColor: Colors.grey.withOpacity(0.1),
      filled: true,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black),
    listTileTheme: const ListTileThemeData(iconColor: Colors.black),
    inputDecorationTheme: _inputDecorationTheme(),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    inputDecorationTheme: _inputDecorationTheme(),
  );
}
