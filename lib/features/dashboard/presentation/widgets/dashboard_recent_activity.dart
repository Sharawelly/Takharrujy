import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'activity_item.dart';

class DashboardRecentActivity extends StatelessWidget {
  const DashboardRecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DashboardConstants.cardWidth.w,
      height: DashboardConstants.recentActivityCardHeight.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.borderVariant),
        borderRadius: BorderRadius.circular(DashboardConstants.borderRadius.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(DashboardConstants.cardPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 16.h),
            _buildActivityItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      DashboardConstants.recentActivityTitle,
      style: AppTextStyles.titleMedium.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.22,
      ),
    );
  }

  Widget _buildActivityItems() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _getActivityData().length,
      itemBuilder: (context, index) {
        final activity = _getActivityData()[index];
        return Padding(
          padding: EdgeInsets.only(
            bottom: index < _getActivityData().length - 1 ? 12.h : 0,
          ),
          child: ActivityItem(
            title: activity['title'],
            time: activity['time'],
            icon: activity['icon'],
            iconColor: activity['iconColor'],
            backgroundColor: activity['backgroundColor'],
            iconBackgroundColor: activity['iconBackgroundColor'],
            onTap: activity['onTap'],
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getActivityData() {
    return [
      {
        'title': DashboardConstants.taskCompletedTitle,
        'time': DashboardConstants.taskCompletedTime,
        'icon': Icons.check_circle_outline,
        'iconColor': AppColors.success,
        'backgroundColor': AppColors.successLight,
        'iconBackgroundColor': AppColors.successLight,
        'onTap': _handleTaskCompletionTap,
      },
      {
        'title': DashboardConstants.messageReceivedTitle,
        'time': DashboardConstants.messageReceivedTime,
        'icon': Icons.message_outlined,
        'iconColor': AppColors.info,
        'backgroundColor': AppColors.infoLight,
        'iconBackgroundColor': AppColors.infoLight,
        'onTap': _handleMessageTap,
      },
      {
        'title': DashboardConstants.deliverableSubmittedTitle,
        'time': DashboardConstants.deliverableSubmittedTime,
        'icon': Icons.description_outlined,
        'iconColor': AppColors.secondary,
        'backgroundColor': AppColors.secondaryLight,
        'iconBackgroundColor': AppColors.secondaryLight,
        'onTap': _handleDeliverableTap,
      },
    ];
  }

  void _handleTaskCompletionTap() {
    // Handle task completion tap
  }

  void _handleMessageTap() {
    // Handle message tap
  }

  void _handleDeliverableTap() {
    // Handle deliverable tap
  }
}
