import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import 'package:takharrujy/core/constants/constants.dart';

class DashboardProjectHeader extends StatelessWidget {
  final VoidCallback? onViewDetailsPressed;

  const DashboardProjectHeader({super.key, this.onViewDetailsPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DashboardConstants.currentProjectTitle,
          style: AppTextStyles.titleMedium.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.56,
          ),
        ),
        _buildViewDetailsButton(),
      ],
    );
  }

  Widget _buildViewDetailsButton() {
    return GestureDetector(
      onTap: onViewDetailsPressed,
      child: Container(
        width: 95.w,
        height: 24.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(
            DashboardConstants.smallBorderRadius.r,
          ),
        ),
        child: Center(
          child: Text(
            DashboardConstants.viewDetailsButton,
            style: AppTextStyles.buttonSmall.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onPrimary,
              height: 1.25,
            ),
          ),
        ),
      ),
    );
  }
}
