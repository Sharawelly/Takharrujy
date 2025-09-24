import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class DashboardWelcomeSection extends StatelessWidget {
  const DashboardWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DashboardConstants.welcomeTitle,
          style: AppTextStyles.headlineSmall.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          DashboardConstants.welcomeSubtitle,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: 1.43,
          ),
        ),
      ],
    );
  }
}
