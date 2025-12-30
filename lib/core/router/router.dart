import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/features/auth/pages/login_page.dart';
import 'package:fin_talk/features/dashboard/pages/dashboard_page.dart';
import 'package:fin_talk/features/chat/pages/chat_page.dart';
import 'package:fin_talk/features/transactions/pages/transactions_page.dart';
import 'package:fin_talk/features/settings/pages/settings_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const DashboardPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.1),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    )),
                    child: child,
                  ),
                );
              },
            ),
          ),
          GoRoute(
            path: '/chat',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ChatPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.1),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    )),
                    child: child,
                  ),
                );
              },
            ),
          ),
              GoRoute(
                path: '/transactions',
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const TransactionsPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.1),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        )),
                        child: child,
                      ),
                    );
                  },
                ),
              ),
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const SettingsPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.1),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        )),
                        child: child,
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    ],
  );
}

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({
    super.key,
    required this.child,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

      void _onItemTapped(int index) {
        setState(() {
          _currentIndex = index;
        });

        switch (index) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/chat');
            break;
          case 2:
            context.go('/transactions');
            break;
          case 3:
            context.go('/settings');
            break;
        }
      }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    
    // Update current index based on location
        if (location == '/') {
          _currentIndex = 0;
        } else if (location == '/chat') {
          _currentIndex = 1;
        } else if (location == '/transactions') {
          _currentIndex = 2;
        } else if (location == '/settings') {
          _currentIndex = 3;
        }

    final theme = Theme.of(context);
    
    return Scaffold(
      key: const Key('main_shell_scaffold'),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        key: const Key('bottom_navigation_bar'),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: theme.colorScheme.surface,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurface.withOpacity(DesignTokens.opacityMedium),
        type: BottomNavigationBarType.fixed,
        elevation: DesignTokens.elevationMedium,
            items: [
              BottomNavigationBarItem(
                key: const Key('nav_dashboard'),
                icon: const PhosphorIcon(PhosphorIconsRegular.chartLine),
                label: AppStrings.dashboard,
              ),
              BottomNavigationBarItem(
                key: const Key('nav_chat'),
                icon: const PhosphorIcon(PhosphorIconsRegular.chatCircle),
                label: AppStrings.chat,
              ),
              BottomNavigationBarItem(
                key: const Key('nav_transactions'),
                icon: const PhosphorIcon(PhosphorIconsRegular.listBullets),
                label: AppStrings.transactions,
              ),
              BottomNavigationBarItem(
                key: const Key('nav_settings'),
                icon: const PhosphorIcon(PhosphorIconsRegular.gear),
                label: AppStrings.settings,
              ),
            ],
      ),
    );
  }
}

