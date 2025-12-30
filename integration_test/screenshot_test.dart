import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fin_talk/main.dart' as app;
import 'dart:io';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Screenshot Tests', () {
    testWidgets('Capture Dashboard Screenshot', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await Future.delayed(const Duration(seconds: 2));

      await _takeScreenshot(tester, 'dashboard');
    });

    testWidgets('Capture Chat Screenshot', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final chatButton = find.byKey(const Key('nav_chat'));
      if (chatButton.evaluate().isNotEmpty) {
        await tester.tap(chatButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }

      await Future.delayed(const Duration(seconds: 2));

      await _takeScreenshot(tester, 'chat');
    });

    testWidgets('Capture Transactions Screenshot', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final transactionsButton = find.byKey(const Key('nav_transactions'));
      if (transactionsButton.evaluate().isNotEmpty) {
        await tester.tap(transactionsButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }

      await Future.delayed(const Duration(seconds: 2));

      await _takeScreenshot(tester, 'transactions');
    });

    testWidgets('Capture Transaction Details Screenshot', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final transactionsButton = find.byKey(const Key('nav_transactions'));
      if (transactionsButton.evaluate().isNotEmpty) {
        await tester.tap(transactionsButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }

      final firstTransaction = find.byType(ListTile).first;
      if (firstTransaction.evaluate().isNotEmpty) {
        await tester.tap(firstTransaction);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }

      await Future.delayed(const Duration(seconds: 2));

      await _takeScreenshot(tester, 'transaction_details');
    });

    testWidgets('Capture Bank Connection Screenshot', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final fab = find.byType(FloatingActionButton);
      if (fab.evaluate().isNotEmpty) {
        await tester.tap(fab);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }

      await Future.delayed(const Duration(seconds: 2));

      await _takeScreenshot(tester, 'bank_connection');
    });
  });
}

Future<void> _takeScreenshot(WidgetTester tester, String name) async {
  final binding = IntegrationTestWidgetsFlutterBinding.instance;
  if (binding != null) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    
    final directory = Directory('screenshots');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    
    await binding.takeScreenshot('screenshots/$name');
    print('Screenshot saved: screenshots/$name.png');
  }
}


