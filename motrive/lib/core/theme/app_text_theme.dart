import 'package:flutter/material.dart';
import 'package:motrive/core/constants/app_colors.dart';

abstract class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: -.5,
    ),

    displayMedium: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      letterSpacing: -.5,
    ),

    displaySmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),

    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),

    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.primary,
    ),

    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary,
    ),

    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.4,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
      height: 1.4,
    ),

    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.textHint,
      height: 1.3,
    ),

    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    ),

    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textHint,
    ),
  );

  static TextTheme darkTextTheme = lightTextTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );
}