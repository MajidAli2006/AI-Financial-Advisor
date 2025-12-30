import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/shared/widgets/transaction_tile.dart';
import 'package:fin_talk/shared/models/transaction.dart';

class RecentTransactionsSection {
  final List<Transaction> transactions;

  const RecentTransactionsSection({
    required this.transactions,
  });

  List<Widget> buildSlivers(BuildContext context) {
    final theme = Theme.of(context);

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            DesignTokens.spacingLG,
            DesignTokens.spacingXL,
            DesignTokens.spacingLG,
            DesignTokens.spacingMD,
          ),
          child: Text(
            AppStrings.recentTransactions,
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final transaction = transactions[index];
            return TransactionTile(
              key: ValueKey('transaction_${transaction.id}'),
              transaction: transaction,
              onTap: () {},
            )
                .animate()
                .fadeIn(
                  duration: DesignTokens.durationSlow.inMilliseconds.ms,
                  delay:
                      (DesignTokens.durationNormal.inMilliseconds + index * 100)
                          .ms,
                )
                .slideY(
                  begin: 0.2,
                  end: 0,
                  duration: DesignTokens.durationSlow.inMilliseconds.ms,
                  delay:
                      (DesignTokens.durationNormal.inMilliseconds + index * 100)
                          .ms,
                );
          },
          childCount: transactions.length,
        ),
      ),
    ];
  }
}
