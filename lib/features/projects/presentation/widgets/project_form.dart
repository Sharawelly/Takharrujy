import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'project_title_field.dart';
import 'project_description_field.dart';
import 'supervisor_field.dart';
import 'category_field.dart';

import 'project_action_buttons.dart';
import 'team_member_widget.dart';
import 'date_fields.dart';

class ProjectForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final List<TeamMember> teamMembers;
  final String? selectedSupervisor;
  final String? selectedCategory;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> supervisors;
  final List<String> categories;
  final ValueChanged<List<TeamMember>> onTeamMembersChanged;
  final ValueChanged<String?> onSupervisorChanged;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<DateTime> onStartDateSelected;
  final ValueChanged<DateTime> onEndDateSelected;
  final VoidCallback onCreateProject;
  final VoidCallback onResetForm;
  final VoidCallback onSaveDraft;

  const ProjectForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    required this.teamMembers,
    required this.selectedSupervisor,
    required this.selectedCategory,
    required this.startDate,
    required this.endDate,
    required this.supervisors,
    required this.categories,
    required this.onTeamMembersChanged,
    required this.onSupervisorChanged,
    required this.onCategoryChanged,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
    required this.onCreateProject,
    required this.onResetForm,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(17.w),
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
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title
            ProjectTitleField(
              key: const Key('titleField'),
              controller: titleController,
            ),
            SizedBox(height: 24.h),

            // Project Description
            ProjectDescriptionField(
              key: const Key('descriptionField'),
              controller: descriptionController,
            ),
            SizedBox(height: 24.h),

            // Team Members
            TeamMemberWidget(
              key: const Key('teamMembersWidget'),
              teamMembers: teamMembers,
              onTeamMembersChanged: onTeamMembersChanged,
            ),
            SizedBox(height: 24.h),

            // Supervisor Preference
            SupervisorField(
              key: const Key('supervisorDropdown'),
              selectedSupervisor: selectedSupervisor,
              supervisors: supervisors,
              onChanged: onSupervisorChanged,
            ),
            SizedBox(height: 24.h),

            // Project Category
            CategoryField(
              key: const Key('categoryDropdown'),
              selectedCategory: selectedCategory,
              categories: categories,
              onChanged: onCategoryChanged,
            ),
            SizedBox(height: 24.h),

            // Date Fields
            DateFields(
              key: const Key('dateFields'),
              startDate: startDate,
              endDate: endDate,
              onStartDateSelected: onStartDateSelected,
              onEndDateSelected: onEndDateSelected,
            ),
            SizedBox(height: 24.h),

            // Action Buttons
            ProjectActionButtons(
              key: const Key('actionButtons'),
              onCreateProject: onCreateProject,
              onResetForm: onResetForm,
              onSaveDraft: onSaveDraft,
            ),
          ],
        ),
      ),
    );
  }
}
