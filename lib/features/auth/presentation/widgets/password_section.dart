import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takharrujy/core/theme/text_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/utils/validators.dart';
import '../../../../l10n/generated/app_localizations.dart';

class PasswordSection extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const PasswordSection({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<PasswordSection> createState() => _PasswordSectionState();
}

class _PasswordSectionState extends State<PasswordSection> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Password Field
        CustomTextField(
          controller: widget.passwordController,
          label: AppLocalizations.of(context)!.password,
          hintText: AppLocalizations.of(context)!.createPassword,
          obscureText: !_isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          validator: Validators.validatePassword,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.h),

        // Password Hint
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.passwordHint,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // Confirm Password Field
        CustomTextField(
          controller: widget.confirmPasswordController,
          label: AppLocalizations.of(context)!.confirmPassword,
          hintText: AppLocalizations.of(context)!.confirmPasswordHint,
          obscureText: !_isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            onPressed: _toggleConfirmPasswordVisibility,
          ),
          validator: (value) => Validators.validateConfirmPassword(
            value,
            widget.passwordController.text,
          ),
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
