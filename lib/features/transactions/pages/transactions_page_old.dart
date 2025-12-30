import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:confetti/confetti.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/constants/app_constants.dart';
import 'package:fin_talk/core/design_system/design_system.dart';
import 'package:fin_talk/shared/widgets/transaction_tile.dart';
import 'package:fin_talk/shared/models/transaction.dart';
import 'package:fin_talk/features/transactions/repositories/transaction_repository.dart';

final transactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final repository = ref.watch(transactionRepositoryProvider);
  return await repository.getTransactions();
});

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: Duration(
        milliseconds: DesignTokens.durationVerySlow.inMilliseconds * 4,
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _showTransactionDetails(Transaction transaction) {
    final repository = ref.read(transactionRepositoryProvider);
    final isCleaned = repository.isCleaned(transaction);

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DesignTokens.radiusXL),
        ),
      ),
      builder: (context) => TransactionDetailSheet(
        transaction: transaction,
        isCleaned: isCleaned,
        onVerify: () {
          _confettiController.play();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(AppStrings.transactionVerified),
              backgroundColor: Theme.of(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionsProvider);
    final repository = ref.read(transactionRepositoryProvider);
    
    final transactions = transactionsAsync.when(
      data: (data) => data,
      loading: () => <Transaction>[],
      error: (_, __) => <Transaction>[],
    );

    return Scaffold(
      key: const Key('transactions_scaffold'),
      body: Stack(
        children: [
          ListView.builder(
            key: const Key('transactions_list'),
            padding: EdgeInsets.symmetric(vertical: DesignTokens.spacingSM),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final isCleaned = repository.isCleaned(transaction);

              return _buildTransactionItem(context, transaction, isCleaned, index);
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 3.14 / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    Transaction transaction,
    bool isCleaned,
    int index,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      key: ValueKey('transaction_item_${transaction.id}'),
      children: [
        TransactionTile(
          key: ValueKey('transaction_tile_${transaction.id}'),
          transaction: transaction,
          onTap: () => _showTransactionDetails(transaction),
        )
            .animate()
            .fadeIn(
              duration: DesignTokens.durationSlow.inMilliseconds.ms,
              delay: (index * 50).ms,
            )
            .slideX(
              begin: -0.1,
              end: 0,
              duration: DesignTokens.durationSlow.inMilliseconds.ms,
              delay: (index * 50).ms,
            ),
        if (isCleaned)
          Positioned(
            right: DesignTokens.spacingLG,
            top: DesignTokens.spacingMD,
            child: Container(
              key: ValueKey('sparkle_${transaction.id}'),
              padding: EdgeInsets.all(DesignTokens.spacingXS),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(DesignTokens.opacityDisabled / 2),
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: PhosphorIcon(
                PhosphorIconsRegular.sparkle,
                color: colorScheme.primary,
                size: DesignTokens.iconXS,
              ),
            )
                .animate()
                .scale(
                  delay: (index * 50 + DesignTokens.durationNormal.inMilliseconds).ms,
                  duration: DesignTokens.durationNormal.inMilliseconds.ms,
                )
                .then()
                .shimmer(
                  duration: (DesignTokens.durationVerySlow.inMilliseconds + 
                      DesignTokens.durationNormal.inMilliseconds).ms,
                  color: colorScheme.primary.withOpacity(DesignTokens.opacityDisabled),
                ),
          ),
      ],
    );
  }
}

class TransactionDetailSheet extends StatefulWidget {
  final Transaction transaction;
  final bool isCleaned;
  final VoidCallback onVerify;

  const TransactionDetailSheet({
    super.key,
    required this.transaction,
    required this.isCleaned,
    required this.onVerify,
  });

  @override
  State<TransactionDetailSheet> createState() => _TransactionDetailSheetState();
}

class _TransactionDetailSheetState extends State<TransactionDetailSheet> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.transaction.category ?? 'Uncategorized';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.all(DesignTokens.spacingLG),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.transactionDetails,
                  style: AppTypography.headlineLarge(context),
                ),
              ),
              IconButton(
                icon: PhosphorIcon(
                  PhosphorIconsRegular.x,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Vertical.lg,
          if (widget.isCleaned && widget.transaction.originalBankText != null) ...[
            _buildDetailRow(
              context,
              AppStrings.originalBankText,
              widget.transaction.originalBankText!,
              theme.colorScheme.onSurfaceVariant,
            ),
            Vertical.md,
            _buildDetailRow(
              context,
              AppStrings.aiCleanedName,
              widget.transaction.name,
              theme.colorScheme.primary,
            ),
            Vertical.lg,
          ] else
            _buildDetailRow(
              context,
              AppStrings.transactionName,
              widget.transaction.name,
              theme.colorScheme.onSurface,
            ),
          Vertical.md,
          _buildDetailRow(
            context,
            AppStrings.amount,
            NumberFormat.currency(symbol: '\$', decimalDigits: 2)
                .format(widget.transaction.amount.abs()),
            widget.transaction.amount < 0 
                ? theme.colorScheme.error 
                : AppColors.success,
          ),
          Vertical.lg,
          Text(
            AppStrings.category,
            style: AppTypography.bodyMedium(context),
          ),
          Vertical.sm,
          Container(
            padding: EdgeInsets.symmetric(horizontal: DesignTokens.spacingMD),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
            ),
            child: DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              dropdownColor: theme.colorScheme.surface,
              style: AppTypography.bodyLarge(context),
              underline: const SizedBox(),
              items: AppConstants.transactionCategories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                }
              },
            ),
          ),
          Vertical.xl,
          AppButton(
            key: const Key('verify_transaction_button'),
            label: AppStrings.verify,
            onPressed: widget.onVerify,
            isFullWidth: true,
            variant: AppButtonVariant.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium(context),
        ),
        Vertical.xs,
        Text(
          value,
          style: AppTypography.titleLarge(context).copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
