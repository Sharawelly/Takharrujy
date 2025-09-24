import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class ProjectTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String helperText;
  final bool isRequired;
  final int maxLines;
  final String? Function(String?)? validator;

  const ProjectTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.helperText,
    this.isRequired = true,
    this.maxLines = 1,
    this.validator,
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
            SizedBox(width: 8.w),
            Text(
              '(English/Arabic)',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Input Field
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.textTertiary,
            ),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: maxLines > 1 ? 12.h : 12.h,
            ),
          ),
          style: AppTextStyles.bodyMedium.copyWith(fontSize: 14.sp),
          validator: validator,
        ),
        SizedBox(height: 8.h),

        // Helper Text
        Text(
          helperText,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
