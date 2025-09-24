import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'form_fields.dart';
import 'dropdown_section.dart';
import 'password_section.dart';
import 'terms_agreement.dart';
import 'form_actions.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onSubmit;
  final VoidCallback onReset;
  final bool isLoading;

  const RegisterForm({
    super.key,
    required this.onSubmit,
    required this.onReset,
    required this.isLoading,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _selectedRole = '';
  String _selectedUniversity = '';
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _selectedRole = '';
      _selectedUniversity = '';
      _agreeToTerms = false;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      widget.onSubmit();
    } else if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.agreeToTermsRequired),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 32.h),

            // Form Fields (Name & Email)
            FormFields(
              nameController: _nameController,
              emailController: _emailController,
            ),
            SizedBox(height: 16.h),

            // Dropdown Section (Role & University)
            DropdownSection(
              selectedRole: _selectedRole,
              selectedUniversity: _selectedUniversity,
              onRoleChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
              onUniversityChanged: (value) {
                setState(() {
                  _selectedUniversity = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Password Section
            PasswordSection(
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
            ),
            SizedBox(height: 24.h),

            // Terms and Privacy Agreement
            TermsAgreement(
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value;
                });
              },
            ),
            SizedBox(height: 32.h),

            // Form Actions (Buttons & Sign In Link)
            FormActions(
              onSubmit: _submitForm,
              onReset: _resetForm,
              isLoading: widget.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
