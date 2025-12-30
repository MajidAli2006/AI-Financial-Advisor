class AppStrings {
  AppStrings._();

  static const String appName = 'FinTalk';
  static const String roastBot = 'Roast Bot';
  static const String totalBalance = 'Total Balance';
  static const String recentTransactions = 'Recent Transactions';
  static const String spendingForecast = 'Spending Forecast';
  static const String connectInstitution = 'Connect your institution';
  static const String transactionDetails = 'Transaction Details';
  static const String transactionName = 'Transaction Name';
  static const String originalBankText = 'Original Bank Text';
  static const String aiCleanedName = 'AI Cleaned Name';
  static const String amount = 'Amount';
  static const String category = 'Category';
  static const String verify = 'Verify';
  static const String login = 'Login';
  static const String loginPagePlaceholder = 'Login Page - Placeholder';
  static const String dashboard = 'Dashboard';
  static const String chat = 'Chat';
  static const String transactions = 'Transactions';
  static const String connectingTo = 'Connecting to';
  static const String successfullyConnected = 'Successfully connected to';
  static const String connectionFailed = 'Connection failed. Please try again.';
  static const String errorLoadingTransactions = 'Error loading transactions:';
  static const String transactionVerified = 'Transaction verified! ✨';
  static const String switchToLightMode = 'Switch to Light Mode';
  static const String switchToDarkMode = 'Switch to Dark Mode';
  
  static String connectingToBank(String bankName) => '$connectingTo $bankName...';
  static String successfullyConnectedTo(String bankName) => '$successfullyConnected $bankName!';
  static String errorLoading(String error) => '$errorLoadingTransactions $error';
}

