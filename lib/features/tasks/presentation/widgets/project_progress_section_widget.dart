import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';
import 'progress_bar_widget.dart';
import 'statistics_card_widget.dart';

class ProjectProgressSectionWidget extends StatelessWidget {
  final double overallCompletion;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;

  const ProjectProgressSectionWidget({
    super.key,
    required this.overallCompletion,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 231.h,
      padding: EdgeInsets.all(17.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              SvgPicture.asset(
                AppImages.projectProgress,
                width: 20.w,
                height: 18.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Project Progress',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Overall Completion
          ProgressBarWidget(
            progress: overallCompletion,
            label: 'Overall Completion',
          ),
          SizedBox(height: 24.h),

          // Statistics Cards
          Row(
            children: [
              StatisticsCardWidget(
                value: totalTasks.toString(),
                label: 'Total',
                backgroundColor: AppColors.backgroundGrey,
                borderColor: const Color(0xFFF3F4F6),
                valueColor: AppColors.textPrimary,
              ),
              SizedBox(width: 12.w),
              StatisticsCardWidget(
                value: completedTasks.toString(),
                label: 'Done',
                backgroundColor: AppColors.successLight,
                borderColor: AppColors.border,
                valueColor: AppColors.success,
              ),
              SizedBox(width: 12.w),
              StatisticsCardWidget(
                value: pendingTasks.toString(),
                label: 'Pending',
                backgroundColor: AppColors.warningLight,
                borderColor: AppColors.border,
                valueColor: AppColors.warningDark,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
