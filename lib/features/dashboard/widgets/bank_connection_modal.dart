import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/core/services/bank_service.dart';

class BankConnectionModal extends StatefulWidget {
  final Function(double) onConnectionSuccess;

  const BankConnectionModal({
    super.key,
    required this.onConnectionSuccess,
  });

  @override
  State<BankConnectionModal> createState() => _BankConnectionModalState();
}

class _BankConnectionModalState extends State<BankConnectionModal> {
  bool _isConnecting = false;
  String? _selectedBank;
  final BankService _bankService = MockBankService();

  static const List<Bank> _banks = [
    Bank(name: 'Chase', icon: PhosphorIconsRegular.bank),
    Bank(name: 'Bank of America', icon: PhosphorIconsRegular.bank),
    Bank(name: 'Wells Fargo', icon: PhosphorIconsRegular.bank),
    Bank(name: 'Citibank', icon: PhosphorIconsRegular.bank),
    Bank(name: 'Capital One', icon: PhosphorIconsRegular.bank),
  ];

  Future<void> _connectBank(String bankName) async {
    setState(() {
      _isConnecting = true;
      _selectedBank = bankName;
    });

    try {
      final success = await _bankService.connectBank(bankName);

      if (mounted && success) {
        final newBalance = await _bankService.fetchBalance();

        setState(() {
          _isConnecting = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.successfullyConnectedTo(bankName)),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );

        widget.onConnectionSuccess(newBalance);
        Navigator.pop(context);
      } else if (mounted) {
        setState(() {
          _isConnecting = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(AppStrings.connectionFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isConnecting = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.connectInstitution),
        leading: IconButton(
          icon: PhosphorIcon(
            PhosphorIconsRegular.x,
            size: DesignTokens.iconMD,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isConnecting
          ? _buildLoadingState(context, theme, colorScheme)
          : _buildBankList(context, theme, colorScheme),
    );
  }

  Widget _buildLoadingState(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Center(
      key: const Key('bank_connection_loading'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            key: const Key('connection_progress'),
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          ),
          SizedBox(height: DesignTokens.spacingLG),
          Text(
            AppStrings.connectingToBank(_selectedBank ?? ''),
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildBankList(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return ListView.builder(
      key: const Key('bank_list'),
      padding: EdgeInsets.all(DesignTokens.spacingMD),
      itemCount: _banks.length,
      itemBuilder: (context, index) {
        final bank = _banks[index];
        return _buildBankItem(context, bank, theme, colorScheme);
      },
    );
  }

  Widget _buildBankItem(
    BuildContext context,
    Bank bank,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Card(
      key: ValueKey('bank_${bank.name}'),
      margin: EdgeInsets.only(bottom: DesignTokens.spacingSM),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: DesignTokens.spacingLG,
          vertical: DesignTokens.spacingSM,
        ),
        leading: Container(
          width: DesignTokens.iconXL,
          height: DesignTokens.iconXL,
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(DesignTokens.opacityDisabled / 4),
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          child: PhosphorIcon(
            bank.icon,
            color: colorScheme.primary,
            size: DesignTokens.iconMD,
          ),
        ),
        title: Text(
          bank.name,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: PhosphorIcon(
          PhosphorIconsRegular.arrowRight,
            color: colorScheme.onSurface.withOpacity(DesignTokens.opacityMedium),
          size: DesignTokens.iconSM,
        ),
        onTap: () => _connectBank(bank.name),
      ),
    );
  }
}

class Bank {
  final String name;
  final IconData icon;

  const Bank({
    required this.name,
    required this.icon,
  });
}

