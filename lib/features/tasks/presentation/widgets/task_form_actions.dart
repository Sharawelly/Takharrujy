import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class TaskFormActions extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onReset;
  final bool isEditMode;

  const TaskFormActions({
    super.key,
    required this.onSubmit,
    required this.onReset,
    this.isEditMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.surface,
              elevation: 1,
              shadowColor: AppColors.shadowLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, size: 12.w, color: AppColors.surface),
                SizedBox(width: 8.w),
                Text(
                  isEditMode ? 'Update' : 'Submit',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.surface,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: 48.w,
          height: 46.h,
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: IconButton(
            onPressed: onReset,
            icon: Icon(Icons.refresh, size: 14.w, color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}
