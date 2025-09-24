import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'settings_dropdown_section.dart';

class LanguageSettingsCard extends StatelessWidget {
  final String selectedInterfaceLanguage;
  final String selectedContentLanguage;
  final ValueChanged<String?> onInterfaceLanguageChanged;
  final ValueChanged<String?> onContentLanguageChanged;

  const LanguageSettingsCard({
    super.key,
    required this.selectedInterfaceLanguage,
    required this.selectedContentLanguage,
    required this.onInterfaceLanguageChanged,
    required this.onContentLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.ai,
                    width: 20.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'Language Settings',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Interface Language
          SettingsDropdownSection(
            label: 'Interface Language',
            value: selectedInterfaceLanguage,
            onChanged: onInterfaceLanguageChanged,
            items: ['English', 'Arabic', 'French', 'Spanish'],
            helperText: 'Select your preferred interface language',
          ),
          SizedBox(height: 16.h),

          // Content Language
          SettingsDropdownSection(
            label: 'Content Language',
            value: selectedContentLanguage,
            onChanged: onContentLanguageChanged,
            items: ['English', 'Arabic', 'French', 'Spanish'],
            helperText: 'Language for project content',
          ),
        ],
      ),
    );
  }
}
