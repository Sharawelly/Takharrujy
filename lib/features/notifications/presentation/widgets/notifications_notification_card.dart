import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'notifications_notification_icon.dart';
import 'notifications_notification_content.dart';

class NotificationsNotificationCard extends StatelessWidget {
  final NotificationItemModel notification;
  final VoidCallback? onTap;

  const NotificationsNotificationCard({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: NotificationsConstants.containerWidth.w,
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: notification.isUnread
              ? Border(
                  left: BorderSide(color: AppColors.border, width: 4),
                  top: BorderSide(color: AppColors.border, width: 1),
                  right: BorderSide(color: AppColors.border, width: 1),
                  bottom: BorderSide(color: AppColors.border, width: 1),
                )
              : Border.all(color: AppColors.border, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(
            NotificationsConstants.borderRadius.r,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(NotificationsConstants.padding.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationsNotificationIcon(type: notification.type),
              SizedBox(width: NotificationsConstants.smallSpacing.w),
              NotificationsNotificationContent(notification: notification),
            ],
          ),
        ),
      ),
    );
  }
}
