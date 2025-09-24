import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'notifications_action_buttons.dart';
import 'notifications_filter_dropdown.dart';

class NotificationsFilterControls extends StatelessWidget {
  final String selectedFilter;
  final String selectedTimeRange;
  final ValueChanged<String?> onFilterChanged;
  final ValueChanged<String?> onTimeRangeChanged;
  final VoidCallback onFilterPressed;
  final VoidCallback onMarkAllReadPressed;

  const NotificationsFilterControls({
    super.key,
    required this.selectedFilter,
    required this.selectedTimeRange,
    required this.onFilterChanged,
    required this.onTimeRangeChanged,
    required this.onFilterPressed,
    required this.onMarkAllReadPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotificationsConstants.containerWidth.w,
      padding: EdgeInsets.symmetric(
        horizontal: NotificationsConstants.padding.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NotificationsActionButtons(
            onFilterPressed: onFilterPressed,
            onMarkAllReadPressed: onMarkAllReadPressed,
          ),
          SizedBox(height: NotificationsConstants.padding.h),
          NotificationsFilterDropdown(
            value: selectedFilter,
            items: NotificationsConstants.filterOptions,
            onChanged: onFilterChanged,
          ),
          SizedBox(height: NotificationsConstants.smallSpacing.h),
          NotificationsFilterDropdown(
            value: selectedTimeRange,
            items: NotificationsConstants.timeRangeOptions,
            onChanged: onTimeRangeChanged,
          ),
        ],
      ),
    );
  }
}
