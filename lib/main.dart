import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_talk/core/router/router.dart';
import 'package:fin_talk/core/theme/app_theme.dart';
import 'package:fin_talk/core/theme/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: FinTalkApp(),
    ),
  );
}

class FinTalkApp extends ConsumerStatefulWidget {
  const FinTalkApp({super.key});

  @override
  ConsumerState<FinTalkApp> createState() => _FinTalkAppState();
}

class _FinTalkAppState extends ConsumerState<FinTalkApp> {
  @override
  void initState() {
    super.initState();
    // Load saved theme preference
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(themeModeNotifierProvider.notifier).loadTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeNotifierProvider);

    return MaterialApp.router(
      title: 'FinTalk',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

