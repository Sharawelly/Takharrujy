import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/conversation_item_model.dart';
import '../../presentation/screens/chat_screen.dart';
import 'package:takharrujy/core/constants/constants.dart';

class MessagesService {
  /// Get sample conversations data
  List<ConversationItemModel> getSampleConversations() {
    return MessagesConstants.sampleConversations
        .map((data) => ConversationItemModel.fromMap(data))
        .toList();
  }

  /// Search conversations by query
  List<ConversationItemModel> searchConversations(
    List<ConversationItemModel> conversations,
    String query,
  ) {
    if (query.isEmpty) return conversations;

    return conversations.where((conversation) {
      return conversation.name.toLowerCase().contains(query.toLowerCase()) ||
          conversation.lastMessage.toLowerCase().contains(
            query.toLowerCase(),
          ) ||
          conversation.role.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  /// Filter conversations by role
  List<ConversationItemModel> filterByRole(
    List<ConversationItemModel> conversations,
    String role,
  ) {
    if (role.isEmpty) return conversations;

    return conversations.where((conversation) {
      return conversation.role == role;
    }).toList();
  }

  /// Filter unread conversations
  List<ConversationItemModel> filterUnread(
    List<ConversationItemModel> conversations,
  ) {
    return conversations.where((conversation) {
      return conversation.isUnread;
    }).toList();
  }

  /// Mark conversation as read
  ConversationItemModel markAsRead(ConversationItemModel conversation) {
    return conversation.copyWith(isUnread: false);
  }

  /// Mark conversation as unread
  ConversationItemModel markAsUnread(ConversationItemModel conversation) {
    return conversation.copyWith(isUnread: true);
  }

  /// Get conversation by ID
  ConversationItemModel? getConversationById(
    List<ConversationItemModel> conversations,
    String id,
  ) {
    try {
      return conversations.firstWhere((conversation) => conversation.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get unread count
  int getUnreadCount(List<ConversationItemModel> conversations) {
    return conversations.where((conversation) => conversation.isUnread).length;
  }

  /// Show success message
  void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.success),
    );
  }

  /// Show info message
  void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.primary),
    );
  }

  /// Show error message
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  /// Navigate to chat screen
  void navigateToChat(
    BuildContext context,
    ConversationItemModel conversation,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(conversation: conversation),
      ),
    );
  }
}
