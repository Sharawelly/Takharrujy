import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'profile_form_field.dart';
import 'profile_button.dart';

class SecurityTab extends StatefulWidget {
  const SecurityTab({super.key});

  @override
  State<SecurityTab> createState() => _SecurityTabState();
}

class _SecurityTabState extends State<SecurityTab> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Change Password',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 20.h),

          // Current Password
          ProfileFormField(
            label: 'Current Password',
            controller: _currentPasswordController,
            width: 316.w,
            obscureText: true,
          ),
          SizedBox(height: 16.h),

          // New Password
          ProfileFormField(
            label: 'New Password',
            controller: _newPasswordController,
            width: 316.w,
            obscureText: true,
          ),
          SizedBox(height: 16.h),

          // Confirm New Password
          ProfileFormField(
            label: 'Confirm New Password',
            controller: _confirmPasswordController,
            width: 316.w,
            obscureText: true,
          ),
          SizedBox(height: 24.h),

          // Update Password Button
          ProfileButton(
            text: 'Update Password',
            onPressed: _updatePassword,
            isPrimary: true,
            width: 316.w,
          ),
        ],
      ),
    );
  }

  void _updatePassword() {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New passwords do not match'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    // TODO: Implement password update functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password updated successfully!'),
        backgroundColor: Color(0xFF16A34A),
      ),
    );

    // Clear password fields
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }
}
