import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_talk/shared/models/transaction.dart';
import 'package:fin_talk/core/constants/app_constants.dart';
import 'package:fin_talk/features/transactions/repositories/transaction_repository.dart';

/// Model for chart data points
class ChartDataPoint {
  final String label;
  final double actual;
  final double predicted;

  ChartDataPoint({
    required this.label,
    required this.actual,
    required this.predicted,
  });
}

/// Provider for user balance state
final balanceProvider = StateProvider<double>((ref) => AppConstants.defaultBalance);

/// Provider for recent transactions (last 3)
final recentTransactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final repository = ref.watch(transactionRepositoryProvider);
  final transactions = await repository.getTransactions();
  // Return only the 3 most recent
  return transactions.take(3).toList();
});

/// Provider for chart data
/// In production, this would fetch from analytics service
final chartDataProvider = Provider<List<ChartDataPoint>>((ref) {
  return [
    ChartDataPoint(label: 'Mon', actual: 1200, predicted: 1100),
    ChartDataPoint(label: 'Tue', actual: 1800, predicted: 1700),
    ChartDataPoint(label: 'Wed', actual: 2200, predicted: 2100),
    ChartDataPoint(label: 'Thu', actual: 2800, predicted: 2700),
    ChartDataPoint(label: 'Fri', actual: 3500, predicted: 3400),
    ChartDataPoint(label: 'Sat', actual: 4200, predicted: 4100),
    ChartDataPoint(label: 'Sun', actual: 4800, predicted: 4700),
  ];
});

