import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';

class ProjectStatisticsWidget extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int inProgressTasks;
  final int deliverables;

  const ProjectStatisticsWidget({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
    required this.inProgressTasks,
    required this.deliverables,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Row
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Total Tasks',
                value: totalTasks.toString(),
                iconPath: 'assets/images/task_list.svg',
                backgroundColor: const Color(0xFFF3F4F6),
                iconColor: AppColors.textSecondary,
                valueColor: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                title: 'Completed',
                value: completedTasks.toString(),
                iconPath: 'assets/images/completed_task.svg',
                backgroundColor: const Color(0xFFDCFCE7),
                iconColor: AppColors.success,
                valueColor: AppColors.success,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Second Row
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'In Progress',
                value: inProgressTasks.toString(),
                iconPath: 'assets/images/pending_task.svg',
                backgroundColor: const Color(0xFFFEF3C7),
                iconColor: AppColors.warningDark,
                valueColor: AppColors.warningDark,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                title: 'Deliverables',
                value: deliverables.toString(),
                iconPath: 'assets/images/deliverable.svg',
                backgroundColor: const Color(0xFFE0F2FE),
                iconColor: AppColors.primary,
                valueColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String iconPath,
    required Color backgroundColor,
    required Color iconColor,
    required Color valueColor,
  }) {
    return Container(
      width: 173.w,
      height: 82.h,
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
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(17.w),
        child: Row(
          children: [
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // Value
                  Text(
                    value,
                    style: AppTextStyles.titleLarge.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: valueColor,
                    ),
                  ),
                ],
              ),
            ),

            // Icon
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
