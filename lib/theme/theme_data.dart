import 'package:flutter/material.dart';
import 'package:whatsapp/extensions/color_extension.dart';
import 'package:whatsapp/utils/constants/constant_colors.dart';
import 'package:whatsapp/utils/constants/constant_font.dart';

class AppTheme {
  AppTheme._();

  ///  LIGHT COLOR SCHEME
  static final ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ConstantColors.whatsAppGreenLight,
    onPrimary: ConstantColors.lightOnPrimary,
    secondary: ConstantColors.whatsAppGreenAccent,
    onSecondary: ConstantColors.lightOnSecondary,
    surface: ConstantColors.lightBackground,
    onSurface: ConstantColors.lightText,
    error: ConstantColors.errorColor,
    onError: Colors.white,
  );

  ///  DARK COLOR SCHEME
  static final ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ConstantColors.whatsAppGreenLight,
    onPrimary: ConstantColors.darkOnPrimary,
    secondary: ConstantColors.whatsAppGreenAccent,
    onSecondary: ConstantColors.darkOnSecondary,
    surface: ConstantColors.darkBackground,
    onSurface: ConstantColors.darkText,
    error: ConstantColors.errorColor,
    onError: Colors.black,
  );

  ///  LIGHT THEME DATA
  static final ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: ConstantColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: ConstantColors.lightBackground,
      foregroundColor: ConstantColors.lightOnPrimary,
      centerTitle: false,
      titleTextStyle: TextStyle(
          color: ConstantColors.whatsAppGreenAccent,
          fontSize: ConstantFont.fontSize24,
          fontWeight: ConstantFont.fontWeightBold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ConstantColors.lightBackground,
      selectedItemColor: ConstantColors.lightText,
      unselectedItemColor: ConstantColors.lightText.withCustomOpacity(0.9),
      selectedLabelStyle: TextStyle(
        fontSize: ConstantFont.fontSize13,
        fontWeight: ConstantFont.fontWeightBold,
        color: ConstantColors.lightText,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: ConstantFont.fontSize13,
        fontWeight: ConstantFont.fontWeightSemiBold,
        color: ConstantColors.lightText.withCustomOpacity(0.9),
      ),
      selectedIconTheme: IconThemeData(
        color: ConstantColors.lightText.withCustomOpacity(0.65),
      ),
      unselectedIconTheme: IconThemeData(
        color: ConstantColors.lightText.withCustomOpacity(0.8),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ConstantColors.whatsAppGreenAccent,
      foregroundColor: ConstantColors.lightText,
    ),
    cardColor: ConstantColors.lightCardColor,
    dividerColor: ConstantColors.lightDivider,
  );

  ///  DARK THEME DATA
  static final ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: ConstantColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: ConstantColors.darkBackground,
      foregroundColor: ConstantColors.darkOnPrimary,
      centerTitle: false,
      titleTextStyle: TextStyle(
          color: ConstantColors.darkText,
          fontSize: ConstantFont.fontSize24,
          fontWeight: ConstantFont.fontWeightBold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ConstantColors.darkBackground,
      selectedItemColor: ConstantColors.darkText,
      unselectedItemColor: ConstantColors.darkText.withCustomOpacity(0.9),
      selectedLabelStyle: TextStyle(
        fontSize: ConstantFont.fontSize13,
        fontWeight: ConstantFont.fontWeightBold,
        color: ConstantColors.darkText,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: ConstantFont.fontSize13,
        fontWeight: ConstantFont.fontWeightSemiBold,
        color: ConstantColors.darkText.withCustomOpacity(0.9),
      ),
      selectedIconTheme: IconThemeData(
        color: ConstantColors.darkText.withCustomOpacity(0.65),
      ),
      unselectedIconTheme: IconThemeData(
        color: ConstantColors.darkText.withCustomOpacity(0.8),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ConstantColors.whatsAppGreenAccent,
      foregroundColor: ConstantColors.darkText,
    ),
    cardColor: ConstantColors.darkCardColor,
    dividerColor: ConstantColors.darkDivider,
  );
}
