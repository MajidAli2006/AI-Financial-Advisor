import 'package:fin_talk/shared/models/transaction.dart';

/// Data source interface following Repository pattern
/// Separates data access from business logic
abstract class TransactionDataSource {
  Future<List<Transaction>> getTransactions();
  Future<Transaction?> getTransactionById(String id);
}

/// Mock implementation of TransactionDataSource
/// In production, this would fetch from API/database
class MockTransactionDataSource implements TransactionDataSource {
  @override
  Future<List<Transaction>> getTransactions() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    return [
      Transaction(
        id: '1',
        name: 'Netflix',
        amount: -15.99,
        date: DateTime.now().subtract(const Duration(days: 1)),
        category: 'Entertainment',
        originalBankText: 'ACH WDL NFLX DAT 99',
      ),
      Transaction(
        id: '2',
        name: 'Starbucks',
        amount: -5.45,
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: 'Food',
        originalBankText: 'ACH WDL SBUX DAT 99',
      ),
      Transaction(
        id: '3',
        name: 'Amazon',
        amount: -89.99,
        date: DateTime.now().subtract(const Duration(days: 3)),
        category: 'Shopping',
        originalBankText: 'ACH WDL AMZN DAT 99',
      ),
      Transaction(
        id: '4',
        name: 'Uber',
        amount: -23.50,
        date: DateTime.now().subtract(const Duration(days: 4)),
        category: 'Transport',
        originalBankText: 'ACH WDL UBER DAT 99',
      ),
      Transaction(
        id: '5',
        name: 'Spotify',
        amount: -9.99,
        date: DateTime.now().subtract(const Duration(days: 5)),
        category: 'Entertainment',
        originalBankText: 'ACH WDL SPOT DAT 99',
      ),
      Transaction(
        id: '6',
        name: 'Electric Bill',
        amount: -120.00,
        date: DateTime.now().subtract(const Duration(days: 6)),
        category: 'Bills',
        originalBankText: 'ACH WDL ELEC DAT 99',
      ),
      Transaction(
        id: '7',
        name: 'Grocery Store',
        amount: -145.67,
        date: DateTime.now().subtract(const Duration(days: 7)),
        category: 'Food',
        originalBankText: 'ACH WDL GROC DAT 99',
      ),
      Transaction(
        id: '8',
        name: 'Gas Station',
        amount: -45.00,
        date: DateTime.now().subtract(const Duration(days: 8)),
        category: 'Transport',
        originalBankText: 'ACH WDL GAS DAT 99',
      ),
    ];
  }

  @override
  Future<Transaction?> getTransactionById(String id) async {
    final transactions = await getTransactions();
    try {
      return transactions.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}


