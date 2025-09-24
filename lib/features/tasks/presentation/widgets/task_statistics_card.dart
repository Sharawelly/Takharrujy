import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';

class TaskStatisticsCard extends StatelessWidget {
  final String title;
  final int count;
  final String iconPath;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const TaskStatisticsCard({
    super.key,
    required this.title,
    required this.count,
    required this.iconPath,
    required this.iconColor,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            children: [
              // Icon Container
              Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [backgroundColor, backgroundColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 14.w,
                    height: 14.h,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              // Title
              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),

              // Count
              Text(
                count.toString(),
                style: AppTextStyles.headlineSmall.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: iconColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
