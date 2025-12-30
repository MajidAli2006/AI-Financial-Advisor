import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: borderRadius ?? BorderRadius.circular(DesignTokens.radiusMD),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: const Duration(milliseconds: 1200),
          color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        );
  }
}

class TransactionSkeleton extends StatelessWidget {
  const TransactionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DesignTokens.spacingMD,
        vertical: DesignTokens.spacingSM,
      ),
      child: Row(
        children: [
          SkeletonLoader(
            width: DesignTokens.iconXL,
            height: DesignTokens.iconXL,
            borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
          ),
          Horizontal.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(
                  width: double.infinity,
                  height: 16,
                ),
                Vertical.xs,
                SkeletonLoader(
                  width: 100,
                  height: 12,
                ),
              ],
            ),
          ),
          SkeletonLoader(
            width: 80,
            height: 16,
          ),
        ],
      ),
    );
  }
}

