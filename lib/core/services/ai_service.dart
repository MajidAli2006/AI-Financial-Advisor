abstract class AIService {
  Future<String> generateResponse(String userInput);
  String cleanTransactionName(String rawText);
  String suggestCategory(String transactionName);
}

class MockAIService implements AIService {
  @override
  Future<String> generateResponse(String userInput) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return _generateMockResponse(userInput);
  }

  @override
  String cleanTransactionName(String rawText) {
    final patterns = {
      'NFLX': 'Netflix',
      'SBUX': 'Starbucks',
      'AMZN': 'Amazon',
      'UBER': 'Uber',
      'SPOT': 'Spotify',
      'ELEC': 'Electric Bill',
      'GROC': 'Grocery Store',
      'GAS': 'Gas Station',
    };

    for (final entry in patterns.entries) {
      if (rawText.contains(entry.key)) {
        return entry.value;
      }
    }

    return rawText;
  }

  @override
  String suggestCategory(String transactionName) {
    final lowerName = transactionName.toLowerCase();
    
    if (lowerName.contains('netflix') || 
        lowerName.contains('spotify') || 
        lowerName.contains('entertainment')) {
      return 'Entertainment';
    } else if (lowerName.contains('starbucks') || 
               lowerName.contains('food') || 
               lowerName.contains('grocery')) {
      return 'Food';
    } else if (lowerName.contains('amazon') || 
               lowerName.contains('shopping')) {
      return 'Shopping';
    } else if (lowerName.contains('uber') || 
               lowerName.contains('gas') || 
               lowerName.contains('transport')) {
      return 'Transport';
    } else if (lowerName.contains('bill') || 
               lowerName.contains('electric')) {
      return 'Bills';
    }
    
    return 'Uncategorized';
  }

  String _generateMockResponse(String userText) {
    final lowerText = userText.toLowerCase();

    if (lowerText.contains('coffee')) {
      return "You spent \$200 on bean water this month. Stop it.";
    } else if (lowerText.contains('ps5') || lowerText.contains('playstation')) {
      return "Your bank balance says 'No', but your impulse control says 'Yes'.";
    } else if (lowerText.contains('spending') || lowerText.contains('spend')) {
      return "Let's talk about your spending habits. Actually, let's not. It's too depressing.";
    } else if (lowerText.contains('balance') || lowerText.contains('money')) {
      return "Your balance is like my patience: running low.";
    } else {
      return "That's an interesting financial choice.";
    }
  }
}

