import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF265D54)),
    scaffoldBackgroundColor: const Color(0xFFF7F6F2),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
    ),
    useMaterial3: true,
  );

  static final ThemeData dark = _darkTheme();

  static ThemeData _darkTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF265D54),
      brightness: Brightness.dark,
    );
    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: const OutlineInputBorder(),
      ),
      useMaterial3: true,
    );
  }
}
