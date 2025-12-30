import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/core/theme/theme_provider.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;

    return IconButton(
      key: const Key('theme_toggle_button'),
      icon: PhosphorIcon(
        isDark ? PhosphorIconsRegular.sun : PhosphorIconsRegular.moon,
        size: DesignTokens.iconMD,
      ),
      tooltip: isDark ? AppStrings.switchToLightMode : AppStrings.switchToDarkMode,
      onPressed: () {
        ref.read(themeModeNotifierProvider.notifier).toggleTheme();
      },
    );
  }
}

