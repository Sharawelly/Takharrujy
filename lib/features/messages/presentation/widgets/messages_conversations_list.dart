import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/conversation_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'messages_conversation_item.dart';

class MessagesConversationsList extends StatelessWidget {
  final List<ConversationItemModel> conversations;
  final Function(ConversationItemModel)? onConversationTap;

  const MessagesConversationsList({
    super.key,
    required this.conversations,
    this.onConversationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290.h,
      child: conversations.isEmpty
          ? _buildEmptyState()
          : _buildConversationsList(),
    );
  }

  Widget _buildConversationsList() {
    return ListView.builder(
      key: const Key('conversationsList'), // 🔑 KEY ADDED
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        final conversation = conversations[index];
        return MessagesConversationItem(
          conversation: conversation,
          onTap: () => onConversationTap?.call(conversation),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64.w,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: 16.h),
          Text(
            MessagesConstants.noConversationsMessage,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
