import 'package:flutter/material.dart';
import 'project_dropdown_field.dart';

class CategoryField extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  const CategoryField({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ProjectDropdownField(
      selectedValue: selectedCategory,
      options: categories,
      onChanged: onChanged,
      label: 'Project Category',
      placeholder: 'Select project category',
      isRequired: true,
    );
  }
}
