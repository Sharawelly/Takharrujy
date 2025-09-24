import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';

class SubmissionGuidelinesWidget extends StatelessWidget {
  const SubmissionGuidelinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final guidelines = [
      'Include all required files in proper format',
      'Use clear file naming conventions',
      'Add descriptive submission notes',
      'Review all details before submitting',
    ];

    return Container(
      width: double.infinity,
      height: 223.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.aiResponse,
                  width: 18.w,
                  height: 18.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Submission Guidelines',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Guidelines List
            ...guidelines.map((guideline) => _buildGuidelineItem(guideline)),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidelineItem(String guideline) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Check Icon
          SvgPicture.asset(
            AppImages.completedTask,
            width: 12.25.w,
            height: 14.h,
            colorFilter: const ColorFilter.mode(
              AppColors.success,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),

          // Guideline Text
          Expanded(
            child: Text(
              guideline,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
