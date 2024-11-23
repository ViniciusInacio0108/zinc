import 'package:flutter/material.dart';

class MyThemeData {
  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
        color: Colors.white,
      )),
      bottomSheetTheme: const BottomSheetThemeData(
        dragHandleColor: const Color.fromRGBO(11, 19, 43, 1),
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: const Color.fromRGBO(11, 19, 43, 1),
        onPrimary: const Color.fromRGBO(28, 37, 65, 1),
        secondary: Colors.white,
        onSecondary: Colors.white.withOpacity(0.5),
        error: Colors.red,
        onError: Colors.red.withOpacity(0.5),
        surface: const Color.fromRGBO(58, 80, 107, 1),
        onSurface: const Color.fromRGBO(91, 192, 190, 1),
      ),
      textTheme: TextTheme(
        bodyMedium: const TextStyle().copyWith(
          color: const Color.fromRGBO(11, 19, 43, 1),
        ),
        titleMedium: const TextStyle().copyWith(
          color: const Color.fromRGBO(11, 19, 43, 1),
        ),
        titleLarge: const TextStyle().copyWith(
          color: const Color.fromRGBO(11, 19, 43, 1),
        ),
      ),
    );
  }
}
