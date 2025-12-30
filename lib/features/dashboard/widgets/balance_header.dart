import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/shared/widgets/animated_balance.dart';

class BalanceHeader extends StatefulWidget {
  final double balance;

  const BalanceHeader({
    super.key,
    required this.balance,
  });

  @override
  State<BalanceHeader> createState() => _BalanceHeaderState();
}

class _BalanceHeaderState extends State<BalanceHeader> {
  bool _balanceVisible = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.all(DesignTokens.spacingLG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.totalBalance,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: DesignTokens.spacingSM),
          Row(
            children: [
              Expanded(
                child: AnimatedBalance(
                  key: const Key('animated_balance'),
                  value: widget.balance,
                  visible: _balanceVisible,
                ),
              ),
              IconButton(
                key: const Key('balance_visibility_toggle'),
                icon: PhosphorIcon(
                  _balanceVisible
                      ? PhosphorIconsRegular.eye
                      : PhosphorIconsRegular.eyeSlash,
                  color: colorScheme.onSurface
                      .withOpacity(DesignTokens.opacityMedium),
                ),
                onPressed: () {
                  setState(() {
                    _balanceVisible = !_balanceVisible;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
