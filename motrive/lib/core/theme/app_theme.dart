import 'package:flutter/material.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'app_text_theme.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: Color(0xff8E24AA),
      secondary: Color(0xffBA68C8),
      surface: Colors.white,
      error: Color(0xffEF4444),
    ),

    scaffoldBackgroundColor: const Color(0xffFCFAFD),

    textTheme: AppTextTheme.lightTextTheme.copyWith(
      headlineLarge: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Color(0xff2D1B35),
      ),

      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xff8E24AA),
      ),

      headlineSmall: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Color(0xff2D1B35),
      ),

      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xff2D1B35),
      ),

      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xff2D1B35),
      ),

      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xff2D1B35),
      ),

      bodyMedium: const TextStyle(
        fontSize: 14,
        color: Color(0xff6B7280),
      ),

      bodySmall: const TextStyle(
        fontSize: 12,
        color: Color(0xff9CA3AF),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Color(0xff2D1B35),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xff2D1B35),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.zero,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff8E24AA),
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xff8E24AA),
        elevation: 0,
        minimumSize: const Size(double.infinity, 58),
        side: const BorderSide(
          color: Color(0xffE9D5F1),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),

      hintStyle: const TextStyle(
        color: Color(0xff9CA3AF),
        fontSize: 15,
      ),

      labelStyle: const TextStyle(
        color: Color(0xff8E24AA),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),

      floatingLabelBehavior: FloatingLabelBehavior.always,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xffE9D5F1),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xffE9D5F1),
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xff8E24AA),
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xffEF4444),
          width: 1,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xffEF4444),
          width: 1.5,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff8E24AA),
      unselectedItemColor: Color(0xff9CA3AF),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff8E24AA),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xffE9D5F1),
      thickness: 1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xff8E24AA),
      secondary: Color(0xffBA68C8),
      surface: Color(0xFF1E1E1E),
      error: Color(0xffEF4444),
    ),

    scaffoldBackgroundColor: const Color(0xFF111827),

    textTheme: AppTextTheme.darkTextTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}