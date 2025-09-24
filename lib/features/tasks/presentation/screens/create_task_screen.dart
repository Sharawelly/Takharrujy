import 'package:flutter/material.dart';
import 'package:takharrujy/core/router/app_router.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/create_task_form_widget.dart';
import '../widgets/project_progress_section_widget.dart';
import '../widgets/task_form_controller.dart';
import '../../data/models/task_model.dart';

class CreateTaskScreen extends StatefulWidget {
  final TaskModel? task;

  const CreateTaskScreen({super.key, this.task});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TaskFormController _formController = TaskFormController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _populateFormWithTaskData();
    }
  }

  void _populateFormWithTaskData() {
    if (widget.task != null) {
      _formController.titleController.text = widget.task!.title;
      _formController.descriptionController.text = widget.task!.description;
      _formController.deadlineController.text = widget.task!.dueDate != null
          ? _formatDate(widget.task!.dueDate!)
          : '';
      _formController.selectedPriority = widget.task!.priority;
      _formController.selectedMember = widget.task!.assignedBy;
      _formController.selectedStatus = widget.task!.status;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: widget.task != null ? 'Edit Task' : 'Create Tasks',
        type: AppBarType.withBackButton,
        showNotifications: true,
        showAvatar: true,
        avatarImage: AppImages.sara,
        onLeadingPressed: () => Navigator.of(context).pop(),
        onNotificationPressed: () => AppRouter.notificationsRoute,
        onProfilePressed: () => AppRouter.profileRoute,
        onSettingsPressed: () => AppRouter.settingsRoute,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Create/Edit Task Section
            CreateTaskFormWidget(
              titleController: _formController.titleController,
              descriptionController: _formController.descriptionController,
              deadlineController: _formController.deadlineController,
              selectedPriority: _formController.selectedPriority,
              selectedMember: _formController.selectedMember,
              selectedStatus: _formController.selectedStatus,
              onPriorityChanged: _formController.updatePriority,
              onMemberChanged: _formController.updateMember,
              onStatusChanged: _formController.updateStatus,
              onDateSelected: () => _formController.selectDate(context),
              onSubmit: () => widget.task != null
                  ? _updateTask(context)
                  : _formController.submitTask(context),
              onReset: _resetForm,
              isEditMode: widget.task != null,
            ),
            SizedBox(height: 16.h),

            // Project Progress Section
            ProjectProgressSectionWidget(
              overallCompletion: _formController.overallCompletion,
              totalTasks: _formController.totalTasks,
              completedTasks: _formController.completedTasks,
              pendingTasks: _formController.pendingTasks,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/create-task',
      ),
    );
  }

  void _updateTask(BuildContext context) {
    if (_formController.titleController.text.isNotEmpty &&
        _formController.deadlineController.text.isNotEmpty) {
      // TODO: Implement actual task update logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Task "${widget.task!.title}" updated successfully!'),
          backgroundColor: AppColors.success,
        ),
      );

      // Navigate back to tasks screen
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill in all required fields'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _resetForm() {
    if (widget.task != null) {
      setState(() {
        _populateFormWithTaskData();
      });
    } else {
      _formController.resetForm();
    }
  }
}
