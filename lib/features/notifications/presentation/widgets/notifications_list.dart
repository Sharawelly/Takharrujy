import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'notifications_notification_card.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationItemModel> notifications;
  final Function(NotificationItemModel)? onNotificationTap;

  const NotificationsList({
    super.key,
    required this.notifications,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotificationsConstants.containerWidth.w,
      padding: EdgeInsets.symmetric(
        horizontal: NotificationsConstants.padding.w,
      ),
      child: notifications.isEmpty
          ? _buildEmptyState()
          : _buildNotificationsList(),
    );
  }

  Widget _buildNotificationsList() {
    return Column(
      children: notifications.map((notification) {
        return Padding(
          padding: EdgeInsets.only(bottom: NotificationsConstants.padding.h),
          child: NotificationsNotificationCard(
            notification: notification,
            onTap: () => onNotificationTap?.call(notification),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 64.w,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: NotificationsConstants.padding.h),
          Text(
            'No notifications found',
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
