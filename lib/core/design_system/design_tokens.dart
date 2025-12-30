import 'package:flutter/material.dart';

class DesignTokens {
  DesignTokens._();

  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  static const double radiusXS = 4.0;
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusFull = 999.0;
  static const double elevationNone = 0.0;
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
  static const double elevationXHigh = 16.0;

  static const double iconXS = 16.0;
  static const double iconSM = 20.0;
  static const double iconMD = 24.0;
  static const double iconLG = 32.0;
  static const double iconXL = 48.0;

  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 800);

  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveEmphasized = Curves.easeOutCubic;
  static const Curve curveDecelerated = Curves.decelerate;
  static const Curve curveAccelerated = Curves.fastOutSlowIn;

  static const double opacityDisabled = 0.38;
  static const double opacityMedium = 0.60;
  static const double opacityHigh = 0.87;
  static const double opacityFull = 1.0;

  static const double breakpointMobile = 600.0;
  static const double breakpointTablet = 900.0;
  static const double breakpointDesktop = 1200.0;

  static const double buttonHeightSM = 32.0;
  static const double buttonHeightMD = 48.0;
  static const double buttonHeightLG = 56.0;
  static const double inputHeightMD = 48.0;
  static const double inputHeightLG = 56.0;
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 64.0;

  static const int zIndexBase = 0;
  static const int zIndexRaised = 10;
  static const int zIndexDropdown = 100;
  static const int zIndexModal = 200;
  static const int zIndexTooltip = 300;

  static const double chartHeight = 200.0;
  static const double chartTitleReservedSize = 30.0;
  static const double chartAxisReservedSize = 50.0;
  static const double chartLineWidth = 3.0;
  static const double chartDashedLineWidth = 2.0;
  static const double chartGridInterval = 2000.0;
  static const double chartMaxY = 10000.0;
  static const List<int> chartDashPattern = [5, 5];
}

