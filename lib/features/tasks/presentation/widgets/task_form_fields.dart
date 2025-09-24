import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/task_model.dart';
import 'task_form_field.dart';

class TaskFormFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController deadlineController;
  final TaskPriority selectedPriority;
  final String selectedMember;
  final TaskStatus selectedStatus;
  final ValueChanged<TaskPriority> onPriorityChanged;
  final ValueChanged<String> onMemberChanged;
  final ValueChanged<TaskStatus> onStatusChanged;
  final VoidCallback onDateSelected;

  const TaskFormFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.deadlineController,
    required this.selectedPriority,
    required this.selectedMember,
    required this.selectedStatus,
    required this.onPriorityChanged,
    required this.onMemberChanged,
    required this.onStatusChanged,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Task Title
        TaskFormField(
          label: 'Task Title *',
          controller: titleController,
          hintText: 'Enter task title',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter task title';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),

        // Description
        TaskTextAreaField(
          label: 'Description',
          controller: descriptionController,
          hintText: 'Enter task description',
          maxLines: 3,
        ),
        SizedBox(height: 16.h),

        // Deadline and Priority Row
        Row(
          children: [
            Expanded(
              child: TaskFormField(
                label: 'Deadline *',
                controller: deadlineController,
                hintText: 'mm/dd/yyyy',
                readOnly: true,
                onTap: onDateSelected,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: SvgPicture.asset(
                    AppImages.date,
                    width: 15.w,
                    height: 10.h,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select deadline';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TaskDropdownField<TaskPriority>(
                label: 'Priority',
                value: selectedPriority,
                items: TaskPriority.values,
                onChanged: (value) {
                  onPriorityChanged(value!);
                },
                itemBuilder: (priority) => Text(priority.displayName),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Assigned Member
        TaskDropdownField<String>(
          label: 'Assigned Member',
          value: selectedMember,
          items: const [
            'Select team member',
            'Ahmed Hassan',
            'Sara Mohamed',
            'Omar Ali',
            'Dr. Smith',
          ],
          onChanged: (value) {
            onMemberChanged(value!);
          },
          itemBuilder: (member) => Text(member),
        ),
        SizedBox(height: 16.h),

        // Status
        TaskDropdownField<TaskStatus>(
          label: 'Status',
          value: selectedStatus,
          items: TaskStatus.values,
          onChanged: (value) {
            onStatusChanged(value!);
          },
          itemBuilder: (status) => Text(status.displayName),
        ),
      ],
    );
  }
}
