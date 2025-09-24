import 'package:flutter/material.dart';
import 'project_dropdown_field.dart';

class SupervisorField extends StatelessWidget {
  final String? selectedSupervisor;
  final List<String> supervisors;
  final ValueChanged<String?> onChanged;

  const SupervisorField({
    super.key,
    required this.selectedSupervisor,
    required this.supervisors,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ProjectDropdownField(
      selectedValue: selectedSupervisor,
      options: supervisors,
      onChanged: onChanged,
      label: 'Supervisor Preference',
      placeholder: 'Select preferred supervisor',
      helperText: 'Optional. Final assignment by admin',
      isRequired: false,
    );
  }
}
