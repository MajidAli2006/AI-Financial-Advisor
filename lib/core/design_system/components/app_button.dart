import 'package:flutter/material.dart';
import '../design_tokens.dart';
import '../typography.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final height = _getHeight();
    final padding = _getPadding();
    final textStyle = _getTextStyle(context);

    Widget button;

    switch (variant) {
      case AppButtonVariant.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            elevation: DesignTokens.elevationNone,
          ),
          child: _buildChild(context, textStyle),
        );
        break;

      case AppButtonVariant.secondary:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.primary,
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
            padding: padding,
            side: BorderSide(color: colorScheme.primary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
          ),
          child: _buildChild(context, textStyle),
        );
        break;

      case AppButtonVariant.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
          ),
          child: _buildChild(context, textStyle),
        );
        break;
    }

    return button;
  }

  Widget _buildChild(BuildContext context, TextStyle textStyle) {
    if (isLoading) {
      return SizedBox(
        height: _getIconSize(),
        width: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AppButtonVariant.primary
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          SizedBox(width: DesignTokens.spacingSM),
          Text(label, style: textStyle),
        ],
      );
    }

    return Text(label, style: textStyle);
  }

  double _getHeight() {
    switch (size) {
      case AppButtonSize.small:
        return DesignTokens.buttonHeightSM;
      case AppButtonSize.medium:
        return DesignTokens.buttonHeightMD;
      case AppButtonSize.large:
        return DesignTokens.buttonHeightLG;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingMD,
          vertical: DesignTokens.spacingXS,
        );
      case AppButtonSize.medium:
        return EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingLG,
          vertical: DesignTokens.spacingSM,
        );
      case AppButtonSize.large:
        return EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingXL,
          vertical: DesignTokens.spacingMD,
        );
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (size) {
      case AppButtonSize.small:
        return AppTypography.labelMedium(context);
      case AppButtonSize.medium:
        return AppTypography.labelLarge(context);
      case AppButtonSize.large:
        return AppTypography.titleMedium(context);
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return DesignTokens.iconXS;
      case AppButtonSize.medium:
        return DesignTokens.iconSM;
      case AppButtonSize.large:
        return DesignTokens.iconMD;
    }
  }
}

enum AppButtonVariant {
  primary,
  secondary,
  text,
}

enum AppButtonSize {
  small,
  medium,
  large,
}

