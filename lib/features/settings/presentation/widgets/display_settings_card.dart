import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'settings_dropdown_section.dart';

class DisplaySettingsCard extends StatelessWidget {
  final String selectedTheme;
  final String selectedDateFormat;
  final String selectedTimeFormat;
  final ValueChanged<String?> onThemeChanged;
  final ValueChanged<String?> onDateFormatChanged;
  final ValueChanged<String?> onTimeFormatChanged;

  const DisplaySettingsCard({
    super.key,
    required this.selectedTheme,
    required this.selectedDateFormat,
    required this.selectedTimeFormat,
    required this.onThemeChanged,
    required this.onDateFormatChanged,
    required this.onTimeFormatChanged,
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
                  color: AppColors.warning,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.active,
                    width: 18.w,
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
                'Display Settings',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Theme
          SettingsDropdownSection(
            label: 'Theme',
            value: selectedTheme,
            onChanged: onThemeChanged,
            items: ['Light Mode', 'Dark Mode', 'Auto'],
          ),
          SizedBox(height: 16.h),

          // Date Format
          SettingsDropdownSection(
            label: 'Date Format',
            value: selectedDateFormat,
            onChanged: onDateFormatChanged,
            items: ['DD/MM/YYYY', 'MM/DD/YYYY', 'YYYY-MM-DD'],
          ),
          SizedBox(height: 16.h),

          // Time Format
          SettingsDropdownSection(
            label: 'Time Format',
            value: selectedTimeFormat,
            onChanged: onTimeFormatChanged,
            items: ['12 Hour (AM/PM)', '24 Hour'],
          ),
        ],
      ),
    );
  }
}
