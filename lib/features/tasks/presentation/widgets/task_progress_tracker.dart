import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';

enum ProgressStep { started, research, submit }

class TaskProgressTracker extends StatelessWidget {
  final ProgressStep currentStep;

  const TaskProgressTracker({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 116.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Task Progress',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 16.h),

            // Progress Steps
            Row(
              children: [
                _buildStep(
                  step: ProgressStep.started,
                  label: 'Started',
                  isCompleted: true,
                  isActive: currentStep == ProgressStep.started,
                ),
                _buildConnector(true),
                _buildStep(
                  step: ProgressStep.research,
                  label: 'Research',
                  isCompleted: currentStep.index >= ProgressStep.research.index,
                  isActive: currentStep == ProgressStep.research,
                ),
                _buildConnector(
                  currentStep.index >= ProgressStep.research.index,
                ),
                _buildStep(
                  step: ProgressStep.submit,
                  label: 'Submit',
                  isCompleted: currentStep == ProgressStep.submit,
                  isActive: currentStep == ProgressStep.submit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required ProgressStep step,
    required String label,
    required bool isCompleted,
    required bool isActive,
  }) {
    Color backgroundColor;
    Color textColor;
    Widget icon;

    if (isCompleted) {
      backgroundColor = AppColors.success;
      textColor = AppColors.textSecondary;
      icon = SvgPicture.asset(
        AppImages.completedTask,
        width: 10.5.w,
        height: 12.h,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      );
    } else if (isActive) {
      backgroundColor = AppColors.primaryDark;
      textColor = AppColors.primaryDark;
      icon = SvgPicture.asset(
        AppImages.uploadDeliverable,
        width: 10.5.w,
        height: 12.h,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      );
    } else {
      backgroundColor = AppColors.border;
      textColor = AppColors.textTertiary;
      icon = SvgPicture.asset(
        AppImages.pendingTask,
        width: 10.5.w,
        height: 12.h,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      );
    }

    return Column(
      children: [
        // Step Circle
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: icon),
        ),
        SizedBox(height: 4.h),

        // Step Label
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildConnector(bool isCompleted) {
    return Container(
      width: 79.78.w,
      height: 2.h,
      margin: EdgeInsets.only(top: 15.h),
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.success : AppColors.border,
        borderRadius: BorderRadius.circular(1.r),
      ),
    );
  }
}
