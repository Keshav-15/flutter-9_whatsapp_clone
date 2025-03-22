import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  // Access ThemeData
  ThemeData get currentTheme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Access specific theme colors
  Color get primaryColor => currentTheme.colorScheme.primary;
  Color get secondaryColor => currentTheme.colorScheme.secondary;
  Color get surfaceColor => currentTheme.colorScheme.surface;
  Color get errorColor => currentTheme.colorScheme.error;

  // Access common theme components like AppBarTheme and FAB Theme
  AppBarTheme get appBarTheme => currentTheme.appBarTheme;
  FloatingActionButtonThemeData get fabTheme =>
      currentTheme.floatingActionButtonTheme;

  // Dark/Light mode check
  bool get isDarkMode => currentTheme.brightness == Brightness.dark;
  bool get isLightMode => currentTheme.brightness == Brightness.light;

  // Access predefined text styles
  TextStyle get headingTextStyle => currentTheme.textTheme.titleLarge!;
  TextStyle get bodyTextStyle => currentTheme.textTheme.bodyLarge!;
}
