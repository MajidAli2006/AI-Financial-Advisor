import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fin_talk/core/services/ai_service.dart';

part 'chat_provider.g.dart';

@riverpod
AIService aiService(AIServiceRef ref) {
  return MockAIService();
}

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  List<types.Message> build() {
    return [
      const types.TextMessage(
        author: types.User(
          id: 'ai',
          firstName: 'Roast Bot',
        ),
        id: 'welcome',
        text: "I'm analyzing your spending. Don't worry, I won't judge... much.",
        createdAt: 0,
      ),
    ];
  }

  Future<void> sendMessage(String text) async {
    final aiService = ref.read(aiServiceProvider);
    
    final userMessage = types.TextMessage(
      author: const types.User(id: 'user'),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    state = [...state, userMessage];

    // Generate AI response using service
    final aiResponse = await aiService.generateResponse(text);

    final aiMessage = types.TextMessage(
      author: const types.User(
        id: 'ai',
        firstName: 'Roast Bot',
      ),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: aiResponse,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    state = [...state, aiMessage];
  }
}

