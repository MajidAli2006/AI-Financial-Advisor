import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_system.dart';
import 'package:fin_talk/core/theme/theme_provider.dart';
import 'package:fin_talk/features/dashboard/providers/dashboard_providers.dart';
import 'package:intl/intl.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final monthlyBudget = ref.watch(monthlyBudgetProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: ListView(
        padding: EdgeInsets.all(DesignTokens.spacingMD),
        children: [
          _buildSectionHeader(context, 'Preferences'),
          Vertical.md,
          _buildThemeToggle(context, ref),
          Vertical.lg,
          _buildSectionHeader(context, AppStrings.budget),
          Vertical.md,
          _buildBudgetSetting(context, ref, monthlyBudget),
          Vertical.lg,
          _buildSectionHeader(context, 'About'),
          Vertical.md,
          _buildAboutSection(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: AppTypography.titleLarge(context),
    );
  }

  Widget _buildThemeToggle(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;

    return AppCard(
      padding: EdgeInsets.all(DesignTokens.spacingMD),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(DesignTokens.spacingSM),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(
                    DesignTokens.opacityDisabled / 4,
                  ),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: PhosphorIcon(
              isDark ? PhosphorIconsRegular.moon : PhosphorIconsRegular.sun,
              color: Theme.of(context).colorScheme.primary,
              size: DesignTokens.iconMD,
            ),
          ),
          Horizontal.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isDark ? AppStrings.switchToLightMode : AppStrings.switchToDarkMode,
                  style: AppTypography.bodyLarge(context),
                ),
                Vertical.xs,
                Text(
                  'Change app appearance',
                  style: AppTypography.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isDark,
            onChanged: (_) {
              ref.read(themeModeNotifierProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetSetting(
    BuildContext context,
    WidgetRef ref,
    double currentBudget,
  ) {
    return AppCard(
      padding: EdgeInsets.all(DesignTokens.spacingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(DesignTokens.spacingSM),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(
                        DesignTokens.opacityDisabled / 4,
                      ),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
                child: PhosphorIcon(
                  PhosphorIconsRegular.wallet,
                  color: Theme.of(context).colorScheme.primary,
                  size: DesignTokens.iconMD,
                ),
              ),
              Horizontal.md,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.monthlyBudget,
                      style: AppTypography.bodyLarge(context),
                    ),
                    Vertical.xs,
                    Text(
                      NumberFormat.currency(symbol: '\$', decimalDigits: 0)
                          .format(currentBudget),
                      style: AppTypography.titleMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Vertical.md,
          Slider(
            value: currentBudget,
            min: 1000,
            max: 10000,
            divisions: 18,
            label: NumberFormat.currency(symbol: '\$', decimalDigits: 0)
                .format(currentBudget),
            onChanged: (value) {
              ref.read(monthlyBudgetProvider.notifier).state = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(DesignTokens.spacingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FinTalk',
            style: AppTypography.titleLarge(context),
          ),
          Vertical.xs,
          Text(
            'Version 1.0.0',
            style: AppTypography.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Vertical.md,
          Text(
            'A high-performance AI financial tracking app built with Flutter.',
            style: AppTypography.bodyMedium(context),
          ),
        ],
      ),
    );
  }
}

