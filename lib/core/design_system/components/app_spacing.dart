import 'package:flutter/material.dart';
import '../design_tokens.dart';

class AppSpacing {
  AppSpacing._();

  static const Widget xs = SizedBox(height: DesignTokens.spacingXS, width: DesignTokens.spacingXS);
  static const Widget sm = SizedBox(height: DesignTokens.spacingSM, width: DesignTokens.spacingSM);
  static const Widget md = SizedBox(height: DesignTokens.spacingMD, width: DesignTokens.spacingMD);
  static const Widget lg = SizedBox(height: DesignTokens.spacingLG, width: DesignTokens.spacingLG);
  static const Widget xl = SizedBox(height: DesignTokens.spacingXL, width: DesignTokens.spacingXL);
  static const Widget xxl = SizedBox(height: DesignTokens.spacingXXL, width: DesignTokens.spacingXXL);
}

class Horizontal {
  Horizontal._();
  static const Widget xs = SizedBox(width: DesignTokens.spacingXS);
  static const Widget sm = SizedBox(width: DesignTokens.spacingSM);
  static const Widget md = SizedBox(width: DesignTokens.spacingMD);
  static const Widget lg = SizedBox(width: DesignTokens.spacingLG);
  static const Widget xl = SizedBox(width: DesignTokens.spacingXL);
  static const Widget xxl = SizedBox(width: DesignTokens.spacingXXL);
}

class Vertical {
  Vertical._();
  static const Widget xs = SizedBox(height: DesignTokens.spacingXS);
  static const Widget sm = SizedBox(height: DesignTokens.spacingSM);
  static const Widget md = SizedBox(height: DesignTokens.spacingMD);
  static const Widget lg = SizedBox(height: DesignTokens.spacingLG);
  static const Widget xl = SizedBox(height: DesignTokens.spacingXL);
  static const Widget xxl = SizedBox(height: DesignTokens.spacingXXL);
}


