import 'package:fin_talk/core/constants/app_constants.dart';

abstract class BankService {
  Future<bool> connectBank(String bankName);
  Future<double> fetchBalance();
  Future<List<Map<String, dynamic>>> fetchTransactions();
}

class MockBankService implements BankService {
  @override
  Future<bool> connectBank(String bankName) async {
    await Future.delayed(AppConstants.bankConnectionDelay);
    return true;
  }

  @override
  Future<double> fetchBalance() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AppConstants.updatedBalanceAfterConnection;
  }

  @override
  Future<List<Map<String, dynamic>>> fetchTransactions() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
  }
}

