# FinTalk Design System

A comprehensive design system for the FinTalk app, following Material Design 3 principles and best practices.

## Table of Contents

- [Overview](#overview)
- [Design Tokens](#design-tokens)
- [Colors](#colors)
- [Typography](#typography)
- [Components](#components)
- [Spacing](#spacing)
- [Usage Guidelines](#usage-guidelines)

## Overview

The FinTalk Design System provides a consistent set of design tokens, components, and guidelines to ensure a cohesive user experience across the entire application.

### Principles

1. **Consistency**: All components follow the same design principles
2. **Accessibility**: WCAG AA compliant color contrasts
3. **Scalability**: Easy to extend and customize
4. **Theme Support**: Full light/dark theme support

## Design Tokens

Design tokens are the atomic design decisions that form the foundation of the design system.

### Spacing

```dart
DesignTokens.spacingXS    // 4px
DesignTokens.spacingSM   // 8px
DesignTokens.spacingMD   // 16px
DesignTokens.spacingLG   // 24px
DesignTokens.spacingXL   // 32px
DesignTokens.spacingXXL  // 48px
```

### Border Radius

```dart
DesignTokens.radiusXS    // 4px
DesignTokens.radiusSM   // 8px
DesignTokens.radiusMD   // 12px
DesignTokens.radiusLG   // 16px
DesignTokens.radiusXL   // 24px
DesignTokens.radiusFull // 999px (circular)
```

### Elevation

```dart
DesignTokens.elevationNone    // 0
DesignTokens.elevationLow     // 2
DesignTokens.elevationMedium  // 4
DesignTokens.elevationHigh    // 8
DesignTokens.elevationXHigh   // 16
```

### Icon Sizes

```dart
DesignTokens.iconXS  // 16px
DesignTokens.iconSM  // 20px
DesignTokens.iconMD  // 24px
DesignTokens.iconLG  // 32px
DesignTokens.iconXL  // 48px
```

### Animation

```dart
// Durations
DesignTokens.durationFast      // 150ms
DesignTokens.durationNormal    // 300ms
DesignTokens.durationSlow      // 500ms
DesignTokens.durationVerySlow  // 800ms

// Curves
DesignTokens.curveDefault      // easeInOut
DesignTokens.curveEmphasized  // easeOutCubic
DesignTokens.curveDecelerated // decelerate
DesignTokens.curveAccelerated // accelerate
```

## Colors

### Primary Colors

```dart
AppColors.primary          // #00FFA3 (Neon Green)
AppColors.primaryDark     // #00CC82
AppColors.primaryLight    // #33FFB8
AppColors.onPrimary       // Black (for text on primary)
```

### Semantic Colors

```dart
AppColors.success  // #00FFA3 (Green)
AppColors.error    // #FF4444 (Red)
AppColors.warning  // #FFB800 (Orange)
AppColors.info     // #00A8FF (Blue)
```

### Theme-Aware Colors

```dart
// Background colors
AppColors.getBackgroundColor(brightness)
AppColors.getSurfaceColor(brightness)

// Text colors
AppColors.getTextPrimaryColor(brightness)
AppColors.getTextSecondaryColor(brightness)
```

## Typography

The typography system uses Inter font family with a consistent scale.

### Text Styles

```dart
// Display
AppTypography.displayLarge(context)    // 36px, Bold
AppTypography.displayMedium(context)   // 28px, Bold

// Headlines
AppTypography.headlineLarge(context)   // 24px, SemiBold
AppTypography.headlineMedium(context)  // 20px, SemiBold
AppTypography.headlineSmall(context)   // 18px, SemiBold

// Titles
AppTypography.titleLarge(context)       // 18px, Medium
AppTypography.titleMedium(context)      // 16px, Medium
AppTypography.titleSmall(context)       // 14px, Medium

// Body
AppTypography.bodyLarge(context)       // 16px, Regular
AppTypography.bodyMedium(context)       // 14px, Regular
AppTypography.bodySmall(context)        // 12px, Regular

// Labels
AppTypography.labelLarge(context)      // 14px, Medium
AppTypography.labelMedium(context)     // 12px, Medium
AppTypography.labelSmall(context)      // 11px, Medium
```

### Semantic Text Styles

```dart
// Amount display
AppTypography.amount(context, isPositive: true)

// Balance display
AppTypography.balance(context)
```

## Components

### AppCard

Standardized card component with consistent styling.

```dart
AppCard(
  child: YourContent(),
  padding: EdgeInsets.all(DesignTokens.spacingMD),
  margin: EdgeInsets.all(DesignTokens.spacingSM),
  elevation: DesignTokens.elevationLow,
  onTap: () {},
)

// Elevated variant
AppCardElevated(
  child: YourContent(),
)

// Outlined variant
AppCardOutlined(
  child: YourContent(),
)
```

### AppButton

Standardized button component with variants and sizes.

```dart
// Primary button
AppButton(
  label: 'Submit',
  onPressed: () {},
  variant: AppButtonVariant.primary,
  size: AppButtonSize.medium,
)

// Secondary button
AppButton(
  label: 'Cancel',
  variant: AppButtonVariant.secondary,
)

// Text button
AppButton(
  label: 'Learn More',
  variant: AppButtonVariant.text,
)

// With icon
AppButton(
  label: 'Save',
  icon: Icon(Icons.save),
)

// Loading state
AppButton(
  label: 'Processing',
  isLoading: true,
)

// Full width
AppButton(
  label: 'Continue',
  isFullWidth: true,
)
```

### AppSpacing

Convenient spacing widgets.

```dart
// General spacing
AppSpacing.xs
AppSpacing.sm
AppSpacing.md
AppSpacing.lg
AppSpacing.xl
AppSpacing.xxl

// Horizontal spacing
AppSpacing.Horizontal.md

// Vertical spacing
AppSpacing.Vertical.lg
```

## Spacing

### Usage Guidelines

1. **Use tokens, not magic numbers**
   ```dart
   // ✅ Good
   SizedBox(height: DesignTokens.spacingMD)
   
   // ❌ Bad
   SizedBox(height: 16)
   ```

2. **Consistent spacing scale**
   - Use spacing tokens for all spacing
   - Follow 4px base unit system
   - Maintain visual rhythm

3. **Component spacing**
   - Cards: `spacingMD` padding
   - Sections: `spacingLG` between
   - Lists: `spacingSM` between items

## Usage Guidelines

### Importing the Design System

```dart
import 'package:fin_talk/core/design_system/design_system.dart';
```

### Best Practices

1. **Always use design tokens**
   - Don't hardcode values
   - Use tokens for consistency

2. **Use theme-aware colors**
   ```dart
   // ✅ Good
   color: Theme.of(context).colorScheme.primary
   
   // ❌ Bad
   color: Colors.green
   ```

3. **Use typography system**
   ```dart
   // ✅ Good
   Text('Hello', style: AppTypography.bodyLarge(context))
   
   // ❌ Bad
   Text('Hello', style: TextStyle(fontSize: 16))
   ```

4. **Use components when available**
   ```dart
   // ✅ Good
   AppCard(child: YourContent())
   
   // ❌ Bad
   Container(
     decoration: BoxDecoration(...),
     child: YourContent(),
   )
   ```

### Component Composition

```dart
AppCard(
  padding: EdgeInsets.all(DesignTokens.spacingLG),
  child: Column(
    children: [
      Text(
        'Title',
        style: AppTypography.headlineMedium(context),
      ),
      AppSpacing.Vertical.md,
      Text(
        'Description',
        style: AppTypography.bodyMedium(context),
      ),
      AppSpacing.Vertical.lg,
      AppButton(
        label: 'Action',
        isFullWidth: true,
      ),
    ],
  ),
)
```

## Examples

### Card with Content

```dart
AppCard(
  padding: EdgeInsets.all(DesignTokens.spacingLG),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Spending Forecast',
        style: AppTypography.headlineMedium(context),
      ),
      AppSpacing.Vertical.md,
      // Chart content
      AppSpacing.Vertical.lg,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: AppTypography.bodyMedium(context),
          ),
          Text(
            '\$1,234.56',
            style: AppTypography.amount(context),
          ),
        ],
      ),
    ],
  ),
)
```

### Button Row

```dart
Row(
  children: [
    Expanded(
      child: AppButton(
        label: 'Cancel',
        variant: AppButtonVariant.secondary,
      ),
    ),
    AppSpacing.Horizontal.md,
    Expanded(
      child: AppButton(
        label: 'Confirm',
        variant: AppButtonVariant.primary,
      ),
    ),
  ],
)
```

## Migration Guide

### From Hardcoded Values

```dart
// Before
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
  ),
)

// After
AppCard(
  padding: EdgeInsets.all(DesignTokens.spacingMD),
  child: YourContent(),
)
```

### From Theme Colors

```dart
// Before
color: AppTheme.primaryGreen

// After
color: AppColors.primary
// Or better:
color: Theme.of(context).colorScheme.primary
```

## Resources

- [Material Design 3](https://m3.material.io/)
- [Design Tokens](https://design-tokens.github.io/community-group/format/)
- [Inter Font](https://rsms.me/inter/)

