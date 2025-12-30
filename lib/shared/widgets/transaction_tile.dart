import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fin_talk/core/design_system/design_system.dart';
import 'package:fin_talk/shared/models/transaction.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onTap;

  const TransactionTile({
    super.key,
    required this.transaction,
    this.onTap,
  });

  IconData _getIconForCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'food':
        return PhosphorIconsRegular.forkKnife;
      case 'shopping':
        return PhosphorIconsRegular.shoppingBag;
      case 'entertainment':
        return PhosphorIconsRegular.television;
      case 'transport':
        return PhosphorIconsRegular.car;
      case 'bills':
        return PhosphorIconsRegular.receipt;
      default:
        return PhosphorIconsRegular.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPositive = transaction.amount > 0;
    final formattedAmount = NumberFormat.currency(symbol: '\$', decimalDigits: 2)
        .format(transaction.amount.abs());

    return AppCard(
      margin: EdgeInsets.symmetric(
        horizontal: DesignTokens.spacingMD,
        vertical: DesignTokens.spacingSM,
      ),
      padding: EdgeInsets.all(DesignTokens.spacingMD),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: DesignTokens.iconXL,
            height: DesignTokens.iconXL,
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(DesignTokens.opacityDisabled / 4),
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: Icon(
              _getIconForCategory(transaction.category),
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
                  transaction.name,
                  style: AppTypography.titleMedium(context),
                ),
                Vertical.xs,
                Text(
                  DateFormat('MMM dd, yyyy').format(transaction.date),
                  style: AppTypography.bodySmall(context),
                ),
              ],
            ),
          ),
          Text(
            isPositive ? '+$formattedAmount' : '-$formattedAmount',
            style: AppTypography.amount(context, isPositive: isPositive),
          ),
        ],
      ),
    );
  }
}

