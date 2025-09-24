import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class ProjectDropdownField extends StatelessWidget {
  final String? selectedValue;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String label;
  final String placeholder;
  final String? helperText;
  final bool isRequired;
  final double? width;
  final double? height;

  const ProjectDropdownField({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
    required this.label,
    required this.placeholder,
    this.helperText,
    this.isRequired = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            if (isRequired)
              Text(
                ' *',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),
          ],
        ),
        SizedBox(height: 12.h),

        // Dropdown
        Container(
          width: double.infinity,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              items: [
                DropdownMenuItem<String>(value: null, child: Text(placeholder)),
                ...options.map(
                  (option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ),
                ),
              ],
              onChanged: onChanged,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
                size: 20.w,
              ),
            ),
          ),
        ),
        if (helperText != null) ...[
          SizedBox(height: 8.h),
          // Helper Text
          Text(
            helperText!,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
