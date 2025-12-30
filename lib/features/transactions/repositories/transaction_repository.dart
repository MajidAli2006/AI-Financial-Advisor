import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_talk/shared/models/transaction.dart';
import 'package:fin_talk/features/transactions/data_sources/transaction_data_source.dart';
import 'package:fin_talk/core/services/ai_service.dart';

part 'transaction_repository.g.dart';

/// Repository pattern implementation
/// Acts as a single source of truth for transaction data
/// Coordinates between data sources and business logic
@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  return TransactionRepository(
    dataSource: MockTransactionDataSource(),
    aiService: MockAIService(),
  );
}

class TransactionRepository {
  final TransactionDataSource dataSource;
  final AIService aiService;

  TransactionRepository({
    required this.dataSource,
    required this.aiService,
  });

  /// Fetches all transactions
  Future<List<Transaction>> getTransactions() async {
    return await dataSource.getTransactions();
  }

  /// Fetches a transaction by ID
  Future<Transaction?> getTransactionById(String id) async {
    return await dataSource.getTransactionById(id);
  }

  /// Checks if a transaction has been cleaned by AI
  bool isCleaned(Transaction transaction) {
    return transaction.originalBankText != null &&
        transaction.originalBankText != transaction.name;
  }

  /// Cleans a transaction name using AI service
  String cleanTransactionName(String rawText) {
    return aiService.cleanTransactionName(rawText);
  }

  /// Suggests a category for a transaction
  String suggestCategory(Transaction transaction) {
    return aiService.suggestCategory(transaction.name);
  }
}

