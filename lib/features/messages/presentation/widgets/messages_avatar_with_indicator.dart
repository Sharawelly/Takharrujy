import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/conversation_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';

class MessagesAvatarWithIndicator extends StatelessWidget {
  final ConversationItemModel conversation;

  const MessagesAvatarWithIndicator({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildAvatar(),
        if (conversation.hasOnlineIndicator) _buildOnlineIndicator(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: MessagesConstants.avatarSize.w,
      height: MessagesConstants.avatarSize.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: conversation.isUnread
            ? const LinearGradient(
                colors: [
                  Color(0xFFEC4899),
                  Color(0xFF3B82F6),
                  Color(0xFFF59E0B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: conversation.isUnread ? null : AppColors.border,
      ),
      child: Center(
        child: SvgPicture.asset(
          conversation.avatar,
          width: MessagesConstants.avatarIconSize.w,
          height: MessagesConstants.avatarIconSize.h,
          colorFilter: ColorFilter.mode(
            conversation.isUnread ? Colors.white : AppColors.textSecondary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildOnlineIndicator() {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        width: MessagesConstants.onlineIndicatorSize.w,
        height: MessagesConstants.onlineIndicatorSize.h,
        decoration: BoxDecoration(
          color: AppColors.info,
          border: Border.all(
            color: Colors.white,
            width: MessagesConstants.onlineIndicatorBorder,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
