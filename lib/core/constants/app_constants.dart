class AppConstants {
  // Colors
  static const String primaryColorHex = '#00FFA3';
  static const String backgroundColorHex = '#121212';
  static const String cardColorHex = '#1E1E1E';

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // API Delays (for mocking)
  static const Duration aiResponseDelay = Duration(milliseconds: 1500);
  static const Duration bankConnectionDelay = Duration(seconds: 2);

  // Default Values
  static const double defaultBalance = 12450.00;
  static const double updatedBalanceAfterConnection = 18500.00;

  // Transaction Categories
  static const List<String> transactionCategories = [
    'Food',
    'Shopping',
    'Entertainment',
    'Transport',
    'Bills',
    'Uncategorized',
  ];
}


