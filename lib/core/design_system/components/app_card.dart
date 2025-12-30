import 'package:flutter/material.dart';
import '../design_tokens.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.backgroundColor,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final card = Card(
      elevation: elevation ?? DesignTokens.elevationLow,
      color: backgroundColor ?? colorScheme.surface,
      margin: margin ?? EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(DesignTokens.spacingMD),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusLG),
        child: card,
      );
    }

    return card;
  }
}

class AppCardElevated extends AppCard {
  const AppCardElevated({
    super.key,
    required super.child,
    super.padding,
    super.margin,
    super.onTap,
    super.borderRadius,
  }) : super(
          elevation: DesignTokens.elevationMedium,
        );
}

class AppCardOutlined extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const AppCardOutlined({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final container = Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.all(DesignTokens.spacingMD),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusLG),
        border: Border.all(
          color: borderColor ?? colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusLG),
        child: container,
      );
    }

    return container;
  }
}

