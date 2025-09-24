import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/task_model.dart';

class TaskDetailsCard extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 204.25.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Priority
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: AppTextStyles.titleLarge.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                _buildPriorityTag(task.priority),
              ],
            ),
            SizedBox(height: 12.h),

            // Description
            Text(
              task.description,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.2,
              ),
            ),
            SizedBox(height: 16.h),

            // Due Date
            _buildDetailRow(
              iconPath: AppImages.date,
              text: 'Due: ${_formatDate(task.dueDate!)}',
            ),
            SizedBox(height: 8.h),

            // Assigned By
            _buildDetailRow(
              iconPath: AppImages.person,
              text: 'Assigned by: ${task.assignedBy}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityTag(TaskPriority priority) {
    Color backgroundColor;
    Color textColor;

    switch (priority) {
      case TaskPriority.low:
        backgroundColor = AppColors.priorityLowBg;
        textColor = AppColors.priorityLowText;
        break;
      case TaskPriority.medium:
        backgroundColor = AppColors.priorityMediumBg;
        textColor = AppColors.priorityMediumText;
        break;
      case TaskPriority.high:
        backgroundColor = AppColors.priorityHighBg;
        textColor = AppColors.priorityHighText;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Text(
        priority.displayName,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildDetailRow({required String iconPath, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 12.25.w,
          height: 14.h,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
