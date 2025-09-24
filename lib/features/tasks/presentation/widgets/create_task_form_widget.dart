import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/task_model.dart';
import 'task_form_header.dart';
import 'task_form_fields.dart';
import 'task_form_actions.dart';

class CreateTaskFormWidget extends StatefulWidget {
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
  final VoidCallback onSubmit;
  final VoidCallback onReset;
  final bool isEditMode;

  const CreateTaskFormWidget({
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
    required this.onSubmit,
    required this.onReset,
    this.isEditMode = false,
  });

  @override
  State<CreateTaskFormWidget> createState() => _CreateTaskFormWidgetState();
}

class _CreateTaskFormWidgetState extends State<CreateTaskFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
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
        children: [
          // Header
          TaskFormHeader(isEditMode: widget.isEditMode),

          // Form
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Form Fields
                  TaskFormFields(
                    titleController: widget.titleController,
                    descriptionController: widget.descriptionController,
                    deadlineController: widget.deadlineController,
                    selectedPriority: widget.selectedPriority,
                    selectedMember: widget.selectedMember,
                    selectedStatus: widget.selectedStatus,
                    onPriorityChanged: widget.onPriorityChanged,
                    onMemberChanged: widget.onMemberChanged,
                    onStatusChanged: widget.onStatusChanged,
                    onDateSelected: widget.onDateSelected,
                  ),
                  SizedBox(height: 24.h),

                  // Action Buttons
                  TaskFormActions(
                    onSubmit: widget.onSubmit,
                    onReset: widget.onReset,
                    isEditMode: widget.isEditMode,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
