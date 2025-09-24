import 'package:flutter/material.dart';
import 'project_text_field.dart';

class ProjectDescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const ProjectDescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      controller: controller,
      label: 'Project Description',
      hintText:
          'Describe your project objectives, scope, and\nexpected outcomes',
      helperText: 'Minimum 50 characters required',
      maxLines: 4,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Project description is required';
        }
        if (value.length < 50) {
          return 'Minimum 50 characters required';
        }
        return null;
      },
    );
  }
}
