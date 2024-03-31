import 'package:flutter/material.dart';

class AppTexts {
  AppTexts._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle(fontSize: 26)
        .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle(fontSize: 24)
        .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    headlineSmall: const TextStyle(fontSize: 18)
        .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle(fontSize: 16)
        .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
    bodyMedium: const TextStyle(fontSize: 14)
        .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
    bodySmall: const TextStyle(fontSize: 12)
        .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle(fontSize: 26)
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle(fontSize: 24)
        .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
    headlineSmall: const TextStyle(fontSize: 18)
        .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle(fontSize: 16)
        .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
    bodyMedium: const TextStyle(fontSize: 14)
        .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
    bodySmall: const TextStyle(fontSize: 12)
        .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
  );
}
