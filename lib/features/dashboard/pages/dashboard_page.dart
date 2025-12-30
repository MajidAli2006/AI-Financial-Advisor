import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/shared/widgets/theme_toggle.dart';
import 'package:fin_talk/features/dashboard/providers/dashboard_providers.dart';
import 'package:fin_talk/features/dashboard/widgets/bank_connection_modal.dart';
import 'package:fin_talk/features/dashboard/widgets/balance_header.dart';
import 'package:fin_talk/features/dashboard/widgets/spending_chart.dart';
import 'package:fin_talk/features/dashboard/widgets/recent_transactions_section.dart';
import 'package:fin_talk/features/dashboard/widgets/budget_card.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(balanceProvider);
    final recentTransactionsAsync = ref.watch(recentTransactionsProvider);
    final monthlyBudget = ref.watch(monthlyBudgetProvider);
    final monthlySpendingAsync = ref.watch(monthlySpendingProvider);

    return Scaffold(
      key: const Key('dashboard_scaffold'),
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: const [
          ThemeToggle(),
          SizedBox(width: DesignTokens.spacingSM),
        ],
      ),
      body: CustomScrollView(
        key: const Key('dashboard_scroll_view'),
        slivers: [
          SliverToBoxAdapter(
            child: BalanceHeader(
              key: const Key('balance_header'),
              balance: balance,
            ),
          ),
          SliverToBoxAdapter(
            child: monthlySpendingAsync.when(
              data: (spent) => BudgetCard(
                key: const Key('budget_card'),
                budget: monthlyBudget,
                spent: spent,
              )
                  .animate()
                  .fadeIn(
                    duration: DesignTokens.durationVerySlow.inMilliseconds.ms,
                    delay: DesignTokens.durationNormal.inMilliseconds.ms,
                  )
                  .slideY(
                    begin: 0.1,
                    end: 0,
                    duration: DesignTokens.durationVerySlow.inMilliseconds.ms,
                    delay: DesignTokens.durationNormal.inMilliseconds.ms,
                  ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ),
          SliverToBoxAdapter(
            child: SpendingChart(
              key: const Key('spending_chart'),
            )
                .animate()
                .fadeIn(
                  duration: DesignTokens.durationVerySlow.inMilliseconds.ms,
                  delay: DesignTokens.durationNormal.inMilliseconds.ms,
                )
                .slideY(
                  begin: 0.1,
                  end: 0,
                  duration: DesignTokens.durationVerySlow.inMilliseconds.ms,
                  delay: DesignTokens.durationNormal.inMilliseconds.ms,
                ),
          ),
          ...recentTransactionsAsync.when(
            data: (transactions) {
              final section =
                  RecentTransactionsSection(transactions: transactions);
              return section.buildSlivers(context);
            },
            loading: () => [
              SliverToBoxAdapter(
                key: const Key('transactions_loading'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(DesignTokens.spacingLG),
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
            error: (error, stack) => [
              SliverToBoxAdapter(
                key: const Key('transactions_error'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(DesignTokens.spacingLG),
                    child: Text(AppStrings.errorLoading(error.toString())),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('bank_connection_fab'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => BankConnectionModal(
              key: const Key('bank_connection_modal'),
              onConnectionSuccess: (newBalance) {
                ref.read(balanceProvider.notifier).state = newBalance;
              },
            ),
          );
        },
        child: PhosphorIcon(
          PhosphorIconsRegular.plugsConnected,
          size: DesignTokens.iconMD + 4,
        ),
      ),
    );
  }
}
