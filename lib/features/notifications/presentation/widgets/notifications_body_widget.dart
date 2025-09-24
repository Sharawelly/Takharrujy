import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'notifications_header.dart';
import 'notifications_filter_controls.dart';
import 'notifications_list.dart';
// import 'notifications_load_more.dart';

class NotificationsBodyWidget extends StatelessWidget {
  final String selectedFilter;
  final String selectedTimeRange;
  final List<NotificationItemModel> filteredNotifications;
  final List<NotificationItemModel> notifications;
  final Function(String?) onFilterChanged;
  final Function(String?) onTimeRangeChanged;
  final VoidCallback onFilterPressed;
  final VoidCallback onMarkAllRead;
  final Function(NotificationItemModel) onNotificationTap;
  final VoidCallback onLoadMore;

  const NotificationsBodyWidget({
    super.key,
    required this.selectedFilter,
    required this.selectedTimeRange,
    required this.filteredNotifications,
    required this.notifications,
    required this.onFilterChanged,
    required this.onTimeRangeChanged,
    required this.onFilterPressed,
    required this.onMarkAllRead,
    required this.onNotificationTap,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotificationsConstants.screenWidth.w,
      height: NotificationsConstants.screenHeight.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        border: Border(
          left: BorderSide(color: AppColors.border, width: 2),
          right: BorderSide(color: AppColors.border, width: 2),
          bottom: BorderSide(color: AppColors.border, width: 2),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            const NotificationsHeader(),
            SizedBox(height: NotificationsConstants.spacing.h),
            _buildFilterControls(),
            SizedBox(height: NotificationsConstants.spacing.h),
            _buildNotificationsList(),
            SizedBox(height: NotificationsConstants.spacing.h),
            // _buildLoadMoreSection(),
            SizedBox(height: NotificationsConstants.spacing.h),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterControls() {
    return NotificationsFilterControls(
      selectedFilter: selectedFilter,
      selectedTimeRange: selectedTimeRange,
      onFilterChanged: onFilterChanged,
      onTimeRangeChanged: onTimeRangeChanged,
      onFilterPressed: onFilterPressed,
      onMarkAllReadPressed: onMarkAllRead,
    );
  }

  Widget _buildNotificationsList() {
    return NotificationsList(
      notifications: filteredNotifications,
      onNotificationTap: onNotificationTap,
    );
  }
}
