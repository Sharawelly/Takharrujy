import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/conversation_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';

class MessagesConversationDetails extends StatelessWidget {
  final ConversationItemModel conversation;

  const MessagesConversationDetails({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MessagesConstants.conversationDetailsHeight.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildNameAndTimeRow(), _buildLastMessage(), _buildRole()],
      ),
    );
  }

  Widget _buildNameAndTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            conversation.name,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: MessagesConstants.nameFontSize.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: MessagesConstants.nameLineHeight,
            ),
          ),
        ),
        Text(
          conversation.timeAgo,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: MessagesConstants.timeFontSize.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: MessagesConstants.timeLineHeight,
          ),
        ),
      ],
    );
  }

  Widget _buildLastMessage() {
    return Text(
      conversation.lastMessage,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: MessagesConstants.messageFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: MessagesConstants.messageLineHeight,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRole() {
    return Text(
      conversation.role,
      style: AppTextStyles.bodySmall.copyWith(
        fontSize: MessagesConstants.roleFontSize.sp,
        fontWeight: FontWeight.w500,
        color: conversation.role == MessagesConstants.supervisorRole
            ? AppColors.primary
            : AppColors.textSecondary,
        height: MessagesConstants.roleLineHeight,
      ),
    );
  }
}
