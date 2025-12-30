import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Inter';

  static TextStyle displayLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      height: 1.2,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle displayMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.25,
      height: 1.3,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle headlineLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle headlineMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle headlineSmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle titleLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle titleMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle titleSmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.5,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.5,
      height: 1.5,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.25,
      height: 1.5,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.4,
      height: 1.5,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle labelLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle labelMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle labelSmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.4,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }

  static TextStyle amount(BuildContext context, {bool isPositive = true}) {
    final colorScheme = Theme.of(context).colorScheme;
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      color: isPositive ? AppColors.success : colorScheme.error,
    );
  }

  static TextStyle balance(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}

