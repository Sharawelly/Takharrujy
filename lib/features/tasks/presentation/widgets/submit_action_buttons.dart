import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/text_styles.dart';

class SubmitActionButtons extends StatelessWidget {
  final VoidCallback onSaveDraft;
  final VoidCallback onSubmitTask;

  const SubmitActionButtons({
    super.key,
    required this.onSaveDraft,
    required this.onSubmitTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 123.h,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Main Buttons
            Row(
              children: [
                // Save Draft Button
                Expanded(
                  child: GestureDetector(
                    onTap: onSaveDraft,
                    child: Container(
                      height: 46.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          'Save Draft',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                // Submit Task Button
                Expanded(
                  child: GestureDetector(
                    onTap: onSubmitTask,
                    child: Container(
                      height: 46.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0284C7), Color(0xFF0369A1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          'Submit Task',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Cancel Button
            GestureDetector(
              onTap: () => context.pop(),
              child: Text(
                'Cancel',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
