import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class ActivityItem {
  final String id;
  final String description;
  final String user;
  final String timeAgo;
  final ActivityType type;

  const ActivityItem({
    required this.id,
    required this.description,
    required this.user,
    required this.timeAgo,
    required this.type,
  });
}

enum ActivityType { taskCompleted, taskCreated, comment, fileUpload }

class RecentActivityWidget extends StatelessWidget {
  final List<ActivityItem> activities;

  const RecentActivityWidget({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(17.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Recent Activity',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),

          // Activities List
          Column(
            children: activities
                .map((activity) => _buildActivityItem(activity))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(ActivityItem activity) {
    return Container(
      width: 324.w,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Indicator
          Container(
            width: 8.w,
            height: 8.h,
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: _getActivityColor(activity.type),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),

          // Activity Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'by ${activity.user} • ${activity.timeAgo}',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getActivityColor(ActivityType type) {
    switch (type) {
      case ActivityType.taskCompleted:
        return AppColors.success;
      case ActivityType.taskCreated:
        return const Color(0xFF0EA5E9);
      case ActivityType.comment:
        return const Color(0xFF8B5CF6);
      case ActivityType.fileUpload:
        return AppColors.warning;
    }
  }
}
