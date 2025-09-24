import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../tasks/data/models/task_model.dart';

class AiTaskPriorityTag extends StatelessWidget {
  final TaskPriority priority;

  const AiTaskPriorityTag({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final colors = _getPriorityColors(priority);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Text(
        priority.displayName,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colors.textColor,
        ),
      ),
    );
  }

  ({Color backgroundColor, Color textColor}) _getPriorityColors(
    TaskPriority priority,
  ) {
    switch (priority) {
      case TaskPriority.high:
        return (
          backgroundColor: AppColors.errorLight,
          textColor: AppColors.errorDark,
        );
      case TaskPriority.medium:
        return (
          backgroundColor: AppColors.warningLight,
          textColor: AppColors.warningDark,
        );
      case TaskPriority.low:
        return (
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textSecondary,
        );
    }
  }
}

class AiTaskStatusTag extends StatelessWidget {
  final TaskStatus status;

  const AiTaskStatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = _getStatusColors(status);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Text(
        status.displayName,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colors.textColor,
        ),
      ),
    );
  }

  ({Color backgroundColor, Color textColor}) _getStatusColors(
    TaskStatus status,
  ) {
    switch (status) {
      case TaskStatus.completed:
        return (
          backgroundColor: AppColors.successLight,
          textColor: AppColors.success,
        );
      case TaskStatus.inProgress:
        return (
          backgroundColor: AppColors.warningLight,
          textColor: AppColors.warningDark,
        );
      case TaskStatus.toDo:
        return (
          backgroundColor: AppColors.grey100,
          textColor: AppColors.textSecondary,
        );
    }
  }
}
