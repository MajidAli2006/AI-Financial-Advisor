import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_system.dart';

class BudgetCard extends StatelessWidget {
  final double budget;
  final double spent;
  final String period;

  const BudgetCard({
    super.key,
    required this.budget,
    required this.spent,
    this.period = 'This Month',
  });

  double get remaining => budget - spent;
  double get progress => budget > 0 ? (spent / budget).clamp(0.0, 1.0) : 0.0;
  bool get isOverBudget => spent > budget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progressColor = isOverBudget ? colorScheme.error : colorScheme.primary;

    return AppCard(
      padding: EdgeInsets.all(DesignTokens.spacingLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(DesignTokens.spacingSM),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(DesignTokens.opacityDisabled / 4),
                  borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
                ),
                child: PhosphorIcon(
                  PhosphorIconsRegular.wallet,
                  color: colorScheme.primary,
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
                      style: AppTypography.labelMedium(context),
                    ),
                    Vertical.xs,
                    Text(
                      period,
                      style: AppTypography.bodySmall(context).copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(budget),
                style: AppTypography.titleLarge(context),
              ),
            ],
          ),
          Vertical.lg,
          ClipRRect(
            borderRadius: BorderRadius.circular(DesignTokens.radiusFull),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
          Vertical.md,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStat(
                context,
                AppStrings.spent,
                NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(spent),
                colorScheme.onSurface,
              ),
              _buildStat(
                context,
                AppStrings.remaining,
                NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(remaining.abs()),
                isOverBudget ? colorScheme.error : colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall(context),
        ),
        Vertical.xs,
        Text(
          value,
          style: AppTypography.titleMedium(context).copyWith(color: valueColor),
        ),
      ],
    );
  }
}

