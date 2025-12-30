class Transaction {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final String? category;
  final String? originalBankText;

  Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    this.category,
    this.originalBankText,
  });
}


