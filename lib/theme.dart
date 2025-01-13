import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade200,
    colorScheme: ColorScheme.light(onSurface: Colors.grey.shade800),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      shape: CircleBorder(),
      elevation: 0,
      backgroundColor: Colors.grey.shade800,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(onSurface: Colors.grey.shade400),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.grey.shade400,
      shape: CircleBorder(),
      elevation: 0,
      backgroundColor: Colors.grey.shade700,
    ),
  );
}
