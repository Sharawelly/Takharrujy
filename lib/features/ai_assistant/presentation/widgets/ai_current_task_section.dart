import 'package:flutter/material.dart';
import 'package:takharrujy/core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../tasks/data/models/task_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'ai_dropdown_field.dart';
import 'ai_section_header.dart';
import 'ai_task_details_header.dart';
import 'ai_task_info_field.dart';
import 'ai_task_progress_bar.dart';
import 'ai_task_tags.dart';

class AiCurrentTaskSection extends StatefulWidget {
  final String selectedTask;
  final List<TaskModel> availableTasks;
  final ValueChanged<String> onTaskChanged;

  const AiCurrentTaskSection({
    super.key,
    required this.selectedTask,
    required this.availableTasks,
    required this.onTaskChanged,
  });

  @override
  State<AiCurrentTaskSection> createState() => _AiCurrentTaskSectionState();
}

class _AiCurrentTaskSectionState extends State<AiCurrentTaskSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AiAssistantConstants.cardPadding.w),
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
        borderRadius: BorderRadius.circular(
          AiAssistantConstants.borderRadius.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AiSectionHeader(
            iconPath: AppImages.taskList,
            title: AiAssistantConstants.currentTaskTitle,
            gradientColors: const [AppColors.info, AppColors.primary],
            iconSize: 40.w,
          ),
          SizedBox(height: 16.h),
          AiDropdownField(
            label: AiAssistantConstants.selectTaskLabel,
            value: widget.selectedTask,
            items: [
              AiAssistantConstants.chooseTaskPlaceholder,
              ...widget.availableTasks.map((task) => task.title),
            ],
            onChanged: (value) => widget.onTaskChanged(value!),
          ),
          SizedBox(height: 16.h),
          _buildTaskDetails(),
        ],
      ),
    );
  }

  Widget _buildTaskDetails() {
    final selectedTask = _getSelectedTask();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(17.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AiTaskDetailsHeader(),
          SizedBox(height: 16.h),
          _buildTaskInfoRow(selectedTask),
          SizedBox(height: 12.h),
          _buildDeadlineStatusRow(selectedTask),
          SizedBox(height: 12.h),
          _buildProgressSection(),
        ],
      ),
    );
  }

  TaskModel _getSelectedTask() {
    return widget.availableTasks.firstWhere(
      (task) => task.title == widget.selectedTask,
      orElse: () => widget.availableTasks.first,
    );
  }

  Widget _buildTaskInfoRow(TaskModel task) {
    return Row(
      children: [
        Expanded(
          child: AiTaskInfoField(
            label: 'Task',
            value: task.title,
            isBold: true,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AiTaskInfoField(
            label: 'Priority',
            child: AiTaskPriorityTag(priority: task.priority),
          ),
        ),
      ],
    );
  }

  Widget _buildDeadlineStatusRow(TaskModel task) {
    return Row(
      children: [
        Expanded(
          child: AiTaskInfoField(
            label: 'Deadline',
            value: task.dueDate != null
                ? '${_getMonthName(task.dueDate!.month)} ${task.dueDate!.day}, ${task.dueDate!.year}'
                : 'No deadline',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AiTaskInfoField(
            label: 'Status',
            child: AiTaskStatusTag(status: task.status),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 4.h),
        const AiTaskProgressBar(),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
