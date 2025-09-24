import 'package:flutter/material.dart';
import 'project_text_field.dart';

class ProjectTitleField extends StatelessWidget {
  final TextEditingController controller;

  const ProjectTitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      controller: controller,
      label: 'Project Title',
      hintText: 'Enter your project title',
      helperText: 'Required field. No special characters allowed.',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Project title is required';
        }
        if (value.length < 3) {
          return 'Project title must be at least 3 characters';
        }
        return null;
      },
    );
  }
}
