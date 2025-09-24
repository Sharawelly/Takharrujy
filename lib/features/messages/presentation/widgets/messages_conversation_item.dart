import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/conversation_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'messages_avatar_with_indicator.dart';
import 'messages_conversation_details.dart';

class MessagesConversationItem extends StatelessWidget {
  final ConversationItemModel conversation;
  final VoidCallback? onTap;

  const MessagesConversationItem({
    super.key,
    required this.conversation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MessagesConstants.containerWidth.w,
        height: MessagesConstants.conversationItemHeight.h,
        decoration: BoxDecoration(
          color: conversation.isUnread
              ? AppColors.primaryLight
              : AppColors.surface,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MessagesConstants.horizontalPadding.w,
            vertical: MessagesConstants.verticalPadding.h,
          ),
          child: Row(
            children: [
              MessagesAvatarWithIndicator(conversation: conversation),
              SizedBox(width: 12.w),
              Expanded(
                child: MessagesConversationDetails(conversation: conversation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
