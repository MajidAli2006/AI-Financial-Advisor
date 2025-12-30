import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/core/design_system/typography.dart';

class AnimatedBalance extends StatefulWidget {
  final double value;
  final bool visible;

  const AnimatedBalance({
    super.key,
    required this.value,
    required this.visible,
  });

  @override
  State<AnimatedBalance> createState() => _AnimatedBalanceState();
}

class _AnimatedBalanceState extends State<AnimatedBalance>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: DesignTokens.durationVerySlow * 2,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.value).animate(
      CurvedAnimation(
        parent: _controller,
        curve: DesignTokens.curveDecelerated,
      ),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedBalance oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animation = Tween<double>(
        begin: oldWidget.value,
        end: widget.value,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: DesignTokens.curveDecelerated,
        ),
      );
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return AnimatedSwitcher(
          duration: DesignTokens.durationNormal,
          child: Text(
            widget.visible
                ? NumberFormat.currency(
                    symbol: '\$',
                    decimalDigits: 2,
                  ).format(_animation.value)
                : '••••••',
            key: ValueKey(widget.visible),
            style: AppTypography.balance(context),
          ),
        );
      },
    );
  }
}

