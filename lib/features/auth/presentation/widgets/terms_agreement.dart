import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:takharrujy/core/theme/text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';

class TermsAgreement extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const TermsAgreement({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) => onChanged(newValue ?? false),
          activeColor: AppColors.primary,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(text: AppLocalizations.of(context)!.agreeToTerms),
                TextSpan(
                  text: AppLocalizations.of(context)!.termsOfService,
                  style: const TextStyle(color: AppColors.primary),
                ),
                TextSpan(text: ' ${AppLocalizations.of(context)!.and} '),
                TextSpan(
                  text: AppLocalizations.of(context)!.privacyPolicy,
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
