import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/utils/validators.dart';
import '../../../../l10n/generated/app_localizations.dart';

class FormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;

  const FormFields({
    super.key,
    required this.nameController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Full Name Field
        CustomTextField(
          controller: nameController,
          label: AppLocalizations.of(context)!.fullName,
          hintText: AppLocalizations.of(context)!.enterFullName,
          validator: Validators.validateFullName,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 16.h),

        // Email Field
        CustomTextField(
          controller: emailController,
          label: AppLocalizations.of(context)!.emailAddress,
          hintText: AppLocalizations.of(context)!.enterEmail,
          keyboardType: TextInputType.emailAddress,
          validator: Validators.validateEmail,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
