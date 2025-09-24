import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/task_model.dart';

class TaskDetailsWidget extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDetailRow(
          iconPath: AppImages.date,
          text:
              task.status == TaskStatus.completed && task.completedDate != null
              ? 'Completed: ${_formatDate(task.completedDate!)}'
              : 'Due: ${_formatDate(task.dueDate!)}',
          textColor: task.status == TaskStatus.completed
              ? AppColors.successDark
              : AppColors.textSecondary,
        ),
        SizedBox(height: 8.h),
        _buildDetailRow(
          iconPath: AppImages.person,
          text: 'Assigned by: ${task.assignedBy}',
          textColor: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required String iconPath,
    required String text,
    required Color textColor,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 10.5.w,
          height: 12.h,
          colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: textColor,
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
