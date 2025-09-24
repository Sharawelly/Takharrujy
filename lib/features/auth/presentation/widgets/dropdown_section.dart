import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'custom_dropdown.dart';

class DropdownSection extends StatelessWidget {
  final String selectedRole;
  final String selectedUniversity;
  final ValueChanged<String> onRoleChanged;
  final ValueChanged<String> onUniversityChanged;

  const DropdownSection({
    super.key,
    required this.selectedRole,
    required this.selectedUniversity,
    required this.onRoleChanged,
    required this.onUniversityChanged,
  });

  static const List<String> _roles = ['Student', 'Supervisor', 'Admin'];
  static const List<String> _universities = [
    'King Saud University',
    'King Abdulaziz University',
    'King Fahd University',
    'Imam Mohammad Ibn Saud University',
    'Princess Nourah University',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Role Dropdown
        CustomDropdown<String>(
          label: AppLocalizations.of(context)!.role,
          hintText: AppLocalizations.of(context)!.selectRole,
          value: selectedRole.isEmpty ? null : selectedRole,
          items: _roles,
          itemBuilder: (role) => role,
          onChanged: (value) => onRoleChanged(value ?? ''),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.roleRequired;
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),

        // University Dropdown
        CustomDropdown<String>(
          label: AppLocalizations.of(context)!.university,
          hintText: AppLocalizations.of(context)!.selectUniversity,
          value: selectedUniversity.isEmpty ? null : selectedUniversity,
          items: _universities,
          itemBuilder: (university) => university,
          onChanged: (value) => onUniversityChanged(value ?? ''),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.universityRequired;
            }
            return null;
          },
        ),
      ],
    );
  }
}
