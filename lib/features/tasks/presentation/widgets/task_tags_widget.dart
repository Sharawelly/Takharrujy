import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/task_model.dart';

class TaskTagsWidget extends StatelessWidget {
  final TaskModel task;

  const TaskTagsWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTag(
          task.priority.displayName,
          _getPriorityColor(task.priority),
          _getPriorityBackgroundColor(task.priority),
        ),
        SizedBox(width: 8.w),
        _buildTag(
          task.status.displayName,
          _getStatusColor(task.status),
          _getStatusBackgroundColor(task.status),
        ),
      ],
    );
  }

  Widget _buildTag(String text, Color textColor, Color backgroundColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return const Color(0xFF334155);
      case TaskPriority.medium:
        return const Color(0xFFB45309);
      case TaskPriority.high:
        return const Color(0xFFB91C1C);
    }
  }

  Color _getPriorityBackgroundColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return const Color(0xFFF1F5F9);
      case TaskPriority.medium:
        return const Color(0xFFFEF3C7);
      case TaskPriority.high:
        return const Color(0xFFFEE2E2);
    }
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.toDo:
        return const Color(0xFF334155);
      case TaskStatus.inProgress:
        return const Color(0xFF0369A1);
      case TaskStatus.completed:
        return const Color(0xFF047857);
    }
  }

  Color _getStatusBackgroundColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.toDo:
        return const Color(0xFFF1F5F9);
      case TaskStatus.inProgress:
        return const Color(0xFFE0F2FE);
      case TaskStatus.completed:
        return const Color(0xFFD1FAE5);
    }
  }
}
