import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/task_model.dart';

class TaskActionButtons extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onActionTap;
  final VoidCallback? onDetailsTap;

  const TaskActionButtons({
    super.key,
    required this.task,
    this.onActionTap,
    this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildActionButton(
            text: _getActionButtonText(),
            isPrimary: true,
            onTap: onActionTap,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildActionButton(
            text: 'Edit',
            isPrimary: false,
            onTap: onDetailsTap,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required bool isPrimary,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        decoration: BoxDecoration(
          gradient: isPrimary
              ? LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: isPrimary ? null : AppColors.surface,
          border: isPrimary ? null : Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isPrimary ? AppColors.surface : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  String _getActionButtonText() {
    switch (task.status) {
      case TaskStatus.toDo:
        return 'Start Task';
      case TaskStatus.inProgress:
        return 'Submit Task';
      case TaskStatus.completed:
        return 'View Submission';
    }
  }
}
