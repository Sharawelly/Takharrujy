import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class DashboardProjectProgress extends StatelessWidget {
  const DashboardProjectProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DashboardConstants.progressLabel,
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
                height: 1.33,
              ),
            ),
            Text(
              DashboardConstants.progressValue,
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1.33,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        _buildProgressBar(),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: 324.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 0.65,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
