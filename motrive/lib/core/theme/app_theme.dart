import 'package:flutter/material.dart';
import 'app_text_theme.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary:  Color(0xff020617),
      secondary: Color(0xff111827),
      surface: Color(0xffF8FAFC),
      error: Color(0xffEF4444),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xff0F172A),
    ),

    scaffoldBackgroundColor: const Color(0xffF8FAFC),

    textTheme: AppTextTheme.lightTextTheme.copyWith(
      headlineLarge: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Color(0xff0F172A),
        letterSpacing: -.8,
        height: 1.1,
      ),
      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xff0F172A),
        letterSpacing: -.6,
        height: 1.1,
      ),
      headlineSmall: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: Color(0xff0F172A),
        letterSpacing: -.4,
        height: 1.1,
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xff0F172A),
        letterSpacing: -.3,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xff0F172A),
        letterSpacing: -.3,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xff0F172A),
        letterSpacing: -.2,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: Color(0xff475569),
        letterSpacing: -.2,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: Color(0xff64748B),
        letterSpacing: -.1,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Color(0xff0F172A)),
      titleTextStyle: TextStyle(
        color: Color(0xff0F172A),
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: -.4,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      margin: EdgeInsets.zero,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff000000),
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: -.2,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xff000000),
        elevation: 0,
        minimumSize: const Size(double.infinity, 58),
        side: const BorderSide(color: Color(0xffE2E8F0), width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
        color: Color(0xff94A3B8),
        fontSize: 15,
      ),
      labelStyle: const TextStyle(
        color: Color(0xff111827),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xffE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xffE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xff000000),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xffEF4444)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xffEF4444),
          width: 1.5,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff000000),
      unselectedItemColor: Color(0xff94A3B8),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff000000),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xffE2E8F0),
      thickness: 1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xffFFFFFF),
      secondary: Color(0xffCBD5E1),
      surface: Color(0xff020617),
      error: Color(0xffEF4444),
      onPrimary: Color(0xff020617),
      onSecondary: Color(0xff020617),
      onSurface: Colors.white,
    ),

    scaffoldBackgroundColor:Color(0xff020617),

    textTheme: AppTextTheme.darkTextTheme.copyWith(
      headlineLarge: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: -.8,
        height: 1.1,
      ),
      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: -.6,
        height: 1.1,
      ),
      headlineSmall: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: -.4,
        height: 1.1,
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: Color(0xffCBD5E1),
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: Color(0xff94A3B8),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    ),

    cardTheme: CardThemeData(
      color: Color(0xff020617),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      margin: EdgeInsets.zero,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff020617),
        elevation: 0,
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Color(0xff334155)),
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xff111827),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      hintStyle: const TextStyle(
        color: Color(0xff64748B),
        fontSize: 15,
      ),
      labelStyle: const TextStyle(
        color: Color(0xffCBD5E1),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xff334155)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xff334155)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xffEF4444)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0xffEF4444),
          width: 1.5,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff111827),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xff64748B),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xff020617),
      elevation: 0,
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xff334155),
      thickness: 1,
    ),
  );
}