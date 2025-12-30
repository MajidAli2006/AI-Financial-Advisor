import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design_system/design_tokens.dart';
import '../design_system/colors.dart';

class AppTheme {
  // Legacy color references (deprecated - use AppColors instead)
  @Deprecated('Use AppColors.primary instead')
  static const Color primaryGreen = AppColors.primary;
  
  @Deprecated('Use AppColors.primaryDark instead')
  static const Color primaryGreenDark = AppColors.primaryDark;

  @Deprecated('Use AppColors.backgroundDark instead')
  static const Color backgroundDark = AppColors.backgroundDark;
  
  @Deprecated('Use AppColors.surfaceDark instead')
  static const Color cardDark = AppColors.surfaceDark;
  
  @Deprecated('Use AppColors.surfaceVariantDark instead')
  static const Color cardDarkElevated = AppColors.surfaceVariantDark;
  
  @Deprecated('Use AppColors.textPrimaryDark instead')
  static const Color textPrimaryDark = AppColors.textPrimaryDark;
  
  @Deprecated('Use AppColors.textSecondaryDark instead')
  static const Color textSecondaryDark = AppColors.textSecondaryDark;
  
  @Deprecated('Use AppColors.textTertiaryDark instead')
  static const Color textTertiaryDark = AppColors.textTertiaryDark;

  @Deprecated('Use AppColors.backgroundLight instead')
  static const Color backgroundLight = AppColors.backgroundLight;
  
  @Deprecated('Use AppColors.surfaceLight instead')
  static const Color cardLight = AppColors.surfaceLight;
  
  @Deprecated('Use AppColors.surfaceVariantLight instead')
  static const Color cardLightElevated = AppColors.surfaceVariantLight;
  
  @Deprecated('Use AppColors.textPrimaryLight instead')
  static const Color textPrimaryLight = AppColors.textPrimaryLight;
  
  @Deprecated('Use AppColors.textSecondaryLight instead')
  static const Color textSecondaryLight = AppColors.textSecondaryLight;
  
  @Deprecated('Use AppColors.textTertiaryLight instead')
  static const Color textTertiaryLight = AppColors.textTertiaryLight;

  @Deprecated('Use AppColors.success instead')
  static const Color textPositive = AppColors.success;
  
  @Deprecated('Use AppColors.error instead')
  static const Color textNegative = AppColors.error;
  
  @Deprecated('Use AppColors.warning instead')
  static const Color textWarning = AppColors.warning;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: ColorScheme.dark(
        primary: primaryGreen,
        secondary: primaryGreenDark,
        surface: cardDark,
        surfaceContainerHighest: cardDarkElevated,
        background: backgroundDark,
        onPrimary: backgroundDark,
        onSecondary: backgroundDark,
        onSurface: textPrimaryDark,
        onBackground: textPrimaryDark,
        error: textNegative,
        onError: textPrimaryDark,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme.apply(
              bodyColor: textPrimaryDark,
              displayColor: textPrimaryDark,
            ),
      ).copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: textPrimaryDark,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimaryDark,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: textPrimaryDark,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textSecondaryDark,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: textTertiaryDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: DesignTokens.elevationNone,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingMD,
          vertical: DesignTokens.spacingSM,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundDark,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: textPrimaryDark),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: DesignTokens.spacingLG,
            vertical: DesignTokens.spacingSM + 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          elevation: DesignTokens.elevationNone,
          minimumSize: Size(0, DesignTokens.buttonHeightMD),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryGreen,
        foregroundColor: backgroundDark,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardDark,
        selectedItemColor: primaryGreen,
        unselectedItemColor: textSecondaryDark,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryGreen, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: ColorScheme.light(
        primary: primaryGreen,
        secondary: primaryGreenDark,
        surface: cardLight,
        surfaceContainerHighest: cardLightElevated,
        background: backgroundLight,
        onPrimary: textPrimaryLight,
        onSecondary: textPrimaryLight,
        onSurface: textPrimaryLight,
        onBackground: textPrimaryLight,
        error: textNegative,
        onError: textPrimaryLight,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.light().textTheme.apply(
              bodyColor: textPrimaryLight,
              displayColor: textPrimaryLight,
            ),
      ).copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: textPrimaryLight,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimaryLight,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: textPrimaryLight,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textSecondaryLight,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: textTertiaryLight,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardLight,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundLight,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: textPrimaryLight),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: textPrimaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryGreen,
        foregroundColor: textPrimaryLight,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardLight,
        selectedItemColor: primaryGreen,
        unselectedItemColor: textSecondaryLight,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textTertiaryLight.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textTertiaryLight.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryGreen, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

