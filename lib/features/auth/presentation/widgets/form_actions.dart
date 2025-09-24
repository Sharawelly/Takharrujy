import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:takharrujy/core/theme/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/router/app_router.dart';

class FormActions extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onReset;
  final bool isLoading;

  const FormActions({
    super.key,
    required this.onSubmit,
    required this.onReset,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Action Buttons
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: AppLocalizations.of(context)!.createAccount,
                onPressed: isLoading ? null : onSubmit,
                isLoading: isLoading,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomButton(
                text: AppLocalizations.of(context)!.resetForm,
                onPressed: onReset,
                variant: ButtonVariant.outlined,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),

        // Sign In Link
        GestureDetector(
          onTap: () => context.go(AppRouter.signInRoute),
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.alreadyHaveAccount,
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.signInHere,
                  style: const TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
