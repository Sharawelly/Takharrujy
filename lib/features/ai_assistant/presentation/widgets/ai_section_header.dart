import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';

class AiSectionHeader extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;
  final List<Color>? gradientColors;
  final Color? iconColor;
  final double? iconSize;

  const AiSectionHeader({
    super.key,
    required this.iconPath,
    required this.title,
    this.subtitle,
    this.gradientColors,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            gradient: gradientColors != null
                ? LinearGradient(
                    colors: gradientColors!,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            color: gradientColors == null ? iconColor : null,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: (24.w) * 0.5,
              height: (24.h) * 0.5,
              colorFilter: gradientColors != null
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            if (subtitle != null) ...[
              SizedBox(height: 2.h),
              Text(
                subtitle!,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
