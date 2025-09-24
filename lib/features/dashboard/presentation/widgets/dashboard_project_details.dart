import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class DashboardProjectDetails extends StatelessWidget {
  const DashboardProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProjectDetail(
          DashboardConstants.statusLabel,
          DashboardConstants.statusValue,
          AppColors.info,
          AppColors.infoLight,
        ),
        SizedBox(height: 8.h),
        _buildProjectDetail(
          DashboardConstants.supervisorLabel,
          DashboardConstants.supervisorValue,
          AppColors.textPrimary,
          null,
        ),
        SizedBox(height: 8.h),
        _buildProjectDetail(
          DashboardConstants.deadlineLabel,
          DashboardConstants.deadlineValue,
          AppColors.textPrimary,
          null,
        ),
      ],
    );
  }

  Widget _buildProjectDetail(
    String label,
    String value,
    Color valueColor,
    Color? backgroundColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
            height: 1.33,
          ),
        ),
        if (backgroundColor != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              value,
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: valueColor,
                height: 1.25,
              ),
            ),
          )
        else
          Text(
            value,
            style: AppTextStyles.labelSmall.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: valueColor,
              height: 1.33,
            ),
          ),
      ],
    );
  }
}
