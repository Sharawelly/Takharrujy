import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class StatisticsCardWidget extends StatelessWidget {
  final String value;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color valueColor;

  const StatisticsCardWidget({
    super.key,
    required this.value,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 75.h,
        padding: EdgeInsets.all(13.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: AppTextStyles.titleLarge.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: valueColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
