import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'stat_card.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: DashboardConstants.activeProjectLabel,
                value: DashboardConstants.activeProjectValue,
                icon: Icons.work_outline,
                iconColor: AppColors.info,
                backgroundColor: AppColors.infoLight,
                onTap: _handleActiveProjectTap,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: StatCard(
                title: DashboardConstants.pendingTasksLabel,
                value: DashboardConstants.pendingTasksValue,
                icon: Icons.pending_actions,
                iconColor: AppColors.warning,
                backgroundColor: AppColors.warningLight,
                onTap: _handlePendingTasksTap,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: DashboardConstants.deadlinesLabel,
                value: DashboardConstants.deadlinesValue,
                icon: Icons.schedule,
                iconColor: AppColors.error,
                backgroundColor: AppColors.errorLight,
                onTap: _handleDeadlinesTap,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: StatCard(
                title: DashboardConstants.notificationsLabel,
                value: DashboardConstants.notificationsValue,
                icon: Icons.notifications_outlined,
                iconColor: AppColors.success,
                backgroundColor: AppColors.successLight,
                onTap: _handleNotificationsTap,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleActiveProjectTap() {
    // Handle active project tap
  }

  void _handlePendingTasksTap() {
    // Handle pending tasks tap
  }

  void _handleDeadlinesTap() {
    // Handle deadlines tap
  }

  void _handleNotificationsTap() {
    // Handle notifications tap
  }
}
