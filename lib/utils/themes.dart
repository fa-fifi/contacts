import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    dividerColor: Colors.transparent,
    canvasColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme:
        const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    dividerColor: Colors.transparent,
    canvasColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme:
        const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  );
}
