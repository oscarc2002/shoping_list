import 'package:flutter/material.dart';
import 'package:shopping_list/core/theme/app_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.seedColor,
      brightness: Brightness.dark,
      surface: AppPallete.surface,
    ),
    scaffoldBackgroundColor: AppPallete.scaffoldBackgroundColor,
  );
}
