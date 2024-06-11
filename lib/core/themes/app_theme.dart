import 'package:flutter/material.dart';
import 'package:hadiths/core/style/app_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Heuristica',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.light,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mainPadding,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorder,
      )
    ),
  );


  static final darkhtTheme = ThemeData(
    fontFamily: 'Heuristica',
      colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mainPadding,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorder,
      ),
    ),
  );
}
