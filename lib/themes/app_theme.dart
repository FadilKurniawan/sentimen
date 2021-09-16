import 'package:flutter/material.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static ThemeData buildThemeData(bool darkMode) {
    return ThemeData(
      primaryColor: Resources.color.colorPrimary,
      accentColor: Resources.color.colorAccent,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Resources.color.colorPrimary,
            secondary: Resources.color.colorPrimary,
          ),
      brightness: (darkMode) ? Brightness.light : Brightness.light,
      scaffoldBackgroundColor: (darkMode)
          ? Resources.color.colorAccentDark
          : Resources.color.scaffoldColor,
      backgroundColor: (darkMode)
          ? Resources.color.colorAccentDark
          : Resources.color.scaffoldColor,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      appBarTheme: (darkMode) ? darkAppBar() : lightAppBar(),
      fontFamily: 'Comfortaa',
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: Resources.color.colorPrimary,
      )),
      bottomNavigationBarTheme:
          (darkMode) ? darkNavigation() : lightNavigation(),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Resources.color.colorPrimary), // Navbar
        headline2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Resources.color.colorPrimary), // Banner
        headline3: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Resources.color.colorAccentDark), // Normal
        headline4: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Resources.color.colorAccentDark),
        headline5: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Resources.color.colorAccentDark), // SubNormal
        headline6: TextStyle(
            fontSize: 12,
            color: Resources.color.colorPrimary,
            fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Resources.color.colorAccentDark.withOpacity(0.8)),
        bodyText2: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Resources.color.colorAccentDark.withOpacity(0.8)),
        button: TextStyle(fontSize: 14, color: Colors.white),
      ),
      inputDecorationTheme: inputDecoration(darkMode),
    );
  }

  static AppBarTheme lightAppBar() {
    return AppBarTheme(
      iconTheme: IconThemeData(
        color: Resources.color.colorAccentDark, //change your color here
      ),
      color: Colors.white,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Resources.color.colorAccentDark,
          fontSize: 16,
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData lightNavigation() {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Resources.color.colorAccentDark,
      selectedItemColor: Colors.deepOrangeAccent,
      elevation: 0,
    );
  }

  static AppBarTheme darkAppBar() {
    return AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      color: Resources.color.colorAccentDark,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData darkNavigation() {
    return BottomNavigationBarThemeData(
      backgroundColor: Resources.color.colorAccentDark,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.deepOrangeAccent,
      elevation: 0,
    );
  }

  // Box Field
  static inputDecoration(bool darkMode) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.borderColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
            color: Resources.color.errorColor.withOpacity(0.8), width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.errorColor, width: 1.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Resources.color.colorPrimary, width: 1),
      ),
      labelStyle: TextStyle(
        color: darkMode
            ? Resources.color.textColorWhite
            : Resources.color.colorAccentDark,
      ),
      hintStyle: TextStyle(color: Resources.color.subHintColor, fontSize: 12),
    );
  }
}
