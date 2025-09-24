import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/message_model.dart';

class ChatMessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool showAvatar;

  const ChatMessageBubble({
    super.key,
    required this.message,
    this.showAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.isFromCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!message.isFromCurrentUser) ...[
          if (showAvatar) ...[
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  AppImages.sara,
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),
          ] else
            SizedBox(width: 44.w),
        ],

        // Message Bubble
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 0.7 * MediaQuery.of(context).size.width,
            ),
            child: Column(
              crossAxisAlignment: message.isFromCurrentUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: 13.h,
                  ),
                  decoration: BoxDecoration(
                    color: message.isFromCurrentUser
                        ? AppColors.primary
                        : AppColors.surface,
                    border: message.isFromCurrentUser
                        ? null
                        : Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowLight,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    message.content,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: message.isFromCurrentUser
                          ? AppColors.white
                          : AppColors.textPrimary,
                      height: 1.21,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  _formatTime(message.timestamp),
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.33,
                  ),
                ),
              ],
            ),
          ),
        ),

        if (message.isFromCurrentUser) ...[
          SizedBox(width: 12.w),
          if (showAvatar) ...[
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  AppImages.sara,
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ] else
            SizedBox(width: 44.w),
        ],
      ],
    );
  }

  String _formatTime(DateTime dateTime) {
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    final displayHour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    return '${displayHour == 0 ? 12 : displayHour}:$minute $period';
  }
}
