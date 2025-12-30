import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF00FFA3);
  static const Color primaryDark = Color(0xFF00CC82);
  static const Color primaryLight = Color(0xFF33FFB8);
  static const Color primaryContainer = Color(0xFF1AFFB3);
  static const Color onPrimary = Color(0xFF000000);
  static const Color onPrimaryContainer = Color(0xFF003D2A);

  static const Color success = Color(0xFF00FFA3);
  static const Color error = Color(0xFFFF4444);
  static const Color warning = Color(0xFFFFB800);
  static const Color info = Color(0xFF00A8FF);

  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color surfaceVariantDark = Color(0xFF2A2A2A);
  static const Color surfaceContainerDark = Color(0xFF2E2E2E);
  
  static const Color onBackgroundDark = Color(0xFFFFFFFF);
  static const Color onSurfaceDark = Color(0xFFFFFFFF);
  static const Color onSurfaceVariantDark = Color(0xFFB0B0B0);

  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF5F5F5);
  static const Color surfaceContainerLight = Color(0xFFEEEEEE);
  
  static const Color onBackgroundLight = Color(0xFF1A1A1A);
  static const Color onSurfaceLight = Color(0xFF1A1A1A);
  static const Color onSurfaceVariantLight = Color(0xFF666666);

  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textTertiaryDark = Color(0xFF808080);
  static const Color textDisabledDark = Color(0xFF606060);
  
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF666666);
  static const Color textTertiaryLight = Color(0xFF999999);
  static const Color textDisabledLight = Color(0xFFCCCCCC);

  static const Color borderDark = Color(0xFF333333);
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color overlayDark = Color(0x80000000);
  static const Color overlayLight = Color(0x80000000);

  static Color getBackgroundColor(Brightness brightness) {
    return brightness == Brightness.dark ? backgroundDark : backgroundLight;
  }

  static Color getSurfaceColor(Brightness brightness) {
    return brightness == Brightness.dark ? surfaceDark : surfaceLight;
  }

  static Color getTextPrimaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? textPrimaryDark : textPrimaryLight;
  }

  static Color getTextSecondaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? textSecondaryDark : textSecondaryLight;
  }
}

