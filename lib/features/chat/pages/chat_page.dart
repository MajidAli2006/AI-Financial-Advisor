import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_system.dart';
import 'package:fin_talk/features/chat/providers/chat_provider.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  static const _user = types.User(id: 'user');

  void _handleSendPressed(types.PartialText message) {
    ref.read(chatNotifierProvider.notifier).sendMessage(message.text);
  }

  DefaultChatTheme _buildChatTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultChatTheme(
      backgroundColor: theme.scaffoldBackgroundColor,
      primaryColor: colorScheme.primary,
      secondaryColor: colorScheme.surface,
      inputBackgroundColor: colorScheme.surface,
      inputTextColor: colorScheme.onSurface,
      receivedMessageBodyTextStyle: AppTypography.bodyLarge(context).copyWith(
        color: colorScheme.onSurface,
      ),
      sentMessageBodyTextStyle: AppTypography.bodyLarge(context).copyWith(
        color: colorScheme.onPrimary,
      ),
      receivedMessageDocumentIconColor: colorScheme.primary,
      sentMessageDocumentIconColor: colorScheme.onPrimary,
      receivedMessageCaptionTextStyle: AppTypography.bodySmall(context),
      sentMessageCaptionTextStyle: AppTypography.bodySmall(context),
      inputBorderRadius: BorderRadius.circular(DesignTokens.radiusXL),
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.roastBot),
      ),
      body: Chat(
        key: const Key('chat_widget'),
        messages: messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        theme: _buildChatTheme(context),
        showUserAvatars: false,
        showUserNames: true,
        inputOptions: const InputOptions(
          sendButtonVisibilityMode: SendButtonVisibilityMode.always,
        ),
      ),
    );
  }
}
