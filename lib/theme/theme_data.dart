import 'package:flutter/material.dart';
import 'package:whatsapp/utils/constants/constant_theme_colors.dart';

class AppTheme {
  AppTheme._();

  ///  LIGHT COLOR SCHEME
  static final ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ConstantThemeColors.whatsAppGreenLight,
    onPrimary: ConstantThemeColors.lightBackground,
    secondary: ConstantThemeColors.whatsAppGreenAccent,
    onSecondary: ConstantThemeColors.lightBackground,
    surface: ConstantThemeColors.lightBackground,
    onSurface: ConstantThemeColors.lightText,
    error: Colors.red,
    onError: Colors.white,
  );

  ///  DARK COLOR SCHEME
  static final ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ConstantThemeColors.whatsAppGreenLight,
    onPrimary: ConstantThemeColors.darkBackground,
    secondary: ConstantThemeColors.whatsAppGreenAccent,
    onSecondary: ConstantThemeColors.darkBackground,
    surface: ConstantThemeColors.darkBackground,
    onSurface: ConstantThemeColors.darkText,
    error: Colors.red.shade400,
    onError: Colors.black,
  );

  ///  LIGHT THEME DATA
  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: _lightColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.secondary,
      foregroundColor: _lightColorScheme.onSecondary,
    ),
  );

  ///  DARK THEME DATA
  static final ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: _darkColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkColorScheme.secondary,
      foregroundColor: _darkColorScheme.onSecondary,
    ),
  );
}
