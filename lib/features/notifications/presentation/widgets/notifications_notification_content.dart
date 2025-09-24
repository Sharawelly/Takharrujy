import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';

class NotificationsNotificationContent extends StatelessWidget {
  final NotificationItemModel notification;

  const NotificationsNotificationContent({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleAndTimeRow(),
          SizedBox(height: NotificationsConstants.tinySpacing.h),
          _buildDescription(),
          SizedBox(height: NotificationsConstants.smallPadding.h),
          _buildTags(),
        ],
      ),
    );
  }

  Widget _buildTitleAndTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            notification.title,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: NotificationsConstants.cardTitleFontSize.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: NotificationsConstants.cardTitleLineHeight,
            ),
          ),
        ),
        Row(
          children: [
            if (notification.isUnread) ...[
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: _getPriorityColor(),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: NotificationsConstants.tinySpacing.w),
            ],
            Text(
              notification.timeAgo,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: NotificationsConstants.timeFontSize.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textTertiary,
                height: NotificationsConstants.timeLineHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      notification.description,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: NotificationsConstants.cardDescriptionFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: NotificationsConstants.cardDescriptionLineHeight,
      ),
    );
  }

  Widget _buildTags() {
    return Row(
      children: notification.tags
          .map(
            (tag) => Padding(
              padding: EdgeInsets.only(
                right: NotificationsConstants.smallPadding.w,
              ),
              child: _buildTag(tag),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTag(String tag) {
    final tagData = _getTagData(tag);
    return Container(
      height: NotificationsConstants.tagHeight.h,
      padding: EdgeInsets.symmetric(
        horizontal: NotificationsConstants.smallPadding.w,
        vertical: NotificationsConstants.tinySpacing.h,
      ),
      decoration: BoxDecoration(
        color: tagData.backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Center(
        child: Text(
          tag,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: NotificationsConstants.tagFontSize.sp,
            fontWeight: FontWeight.w500,
            color: tagData.textColor,
            height: NotificationsConstants.tagLineHeight,
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor() {
    switch (notification.priority) {
      case NotificationPriority.high:
        return AppColors.error;
      case NotificationPriority.medium:
        return AppColors.info;
      case NotificationPriority.low:
        return AppColors.textTertiary;
    }
  }

  _TagData _getTagData(String tag) {
    switch (tag) {
      case NotificationsConstants.highPriorityTag:
        return _TagData(
          backgroundColor: AppColors.errorLight,
          textColor: AppColors.textPrimary,
        );
      case NotificationsConstants.deadlineTag:
        return _TagData(
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textPrimary,
        );
      case NotificationsConstants.approvedTag:
        return _TagData(
          backgroundColor: AppColors.successLight,
          textColor: AppColors.textPrimary,
        );
      case NotificationsConstants.feedbackTag:
        return _TagData(
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textPrimary,
        );
      case NotificationsConstants.messageTag:
        return _TagData(
          backgroundColor: AppColors.primaryLight,
          textColor: AppColors.primaryDark,
        );
      case NotificationsConstants.taskTag:
        return _TagData(
          backgroundColor: AppColors.warningLight,
          textColor: AppColors.textPrimary,
        );
      case NotificationsConstants.teamUpdateTag:
        return _TagData(
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textPrimary,
        );
      case NotificationsConstants.announcementTag:
        return _TagData(
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textPrimary,
        );
      default:
        return _TagData(
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textPrimary,
        );
    }
  }
}

class _TagData {
  final Color backgroundColor;
  final Color textColor;

  _TagData({required this.backgroundColor, required this.textColor});
}
