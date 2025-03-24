import 'package:flutter/material.dart';
import 'package:whatsapp/utils/constants/constant_theme_colors.dart';

class AppTheme {
  AppTheme._();

  ///  LIGHT COLOR SCHEME
  static final ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ConstantThemeColors.whatsAppGreenLight,
    onPrimary: ConstantThemeColors.lightOnPrimary,
    secondary: ConstantThemeColors.whatsAppGreenAccent,
    onSecondary: ConstantThemeColors.lightOnSecondary,
    surface: ConstantThemeColors.lightBackground,
    onSurface: ConstantThemeColors.lightText,
    error: ConstantThemeColors.errorColor,
    onError: Colors.white,
  );

  ///  DARK COLOR SCHEME
  static final ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ConstantThemeColors.whatsAppGreenLight,
    onPrimary: ConstantThemeColors.darkOnPrimary,
    secondary: ConstantThemeColors.whatsAppGreenAccent,
    onSecondary: ConstantThemeColors.darkOnSecondary,
    surface: ConstantThemeColors.darkBackground,
    onSurface: ConstantThemeColors.darkText,
    error: ConstantThemeColors.errorColor,
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
    cardColor: ConstantThemeColors.lightCardColor,
    dividerColor: ConstantThemeColors.lightDivider,
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
    cardColor: ConstantThemeColors.darkCardColor,
    dividerColor: ConstantThemeColors.darkDivider,
  );
}
