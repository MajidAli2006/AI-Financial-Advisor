import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_talk/shared/models/transaction.dart';

part 'transaction_filter_provider.g.dart';

@riverpod
class TransactionFilter extends _$TransactionFilter {
  @override
  TransactionFilterState build() => const TransactionFilterState();

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void updateCategory(String? category) {
    state = state.copyWith(selectedCategory: category);
  }

  void clearFilters() {
    state = const TransactionFilterState();
  }

  List<Transaction> filterTransactions(List<Transaction> transactions) {
    var filtered = transactions;

    if (state.searchQuery.isNotEmpty) {
      final query = state.searchQuery.toLowerCase();
      filtered = filtered.where((transaction) {
        return transaction.name.toLowerCase().contains(query) ||
            (transaction.category?.toLowerCase().contains(query) ?? false) ||
            (transaction.originalBankText?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    if (state.selectedCategory != null && state.selectedCategory!.isNotEmpty) {
      filtered = filtered.where((transaction) {
        return transaction.category == state.selectedCategory;
      }).toList();
    }

    return filtered;
  }
}

class TransactionFilterState {
  final String searchQuery;
  final String? selectedCategory;

  const TransactionFilterState({
    this.searchQuery = '',
    this.selectedCategory,
  });

  TransactionFilterState copyWith({
    String? searchQuery,
    String? selectedCategory,
  }) {
    return TransactionFilterState(
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

