import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final scheme = ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4));

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    cardTheme: const CardThemeData(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
