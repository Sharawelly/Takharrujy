import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';

class AiTaskDetailsHeader extends StatelessWidget {
  const AiTaskDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.aiResponse,
          width: 12.w,
          height: 12.h,
          colorFilter: const ColorFilter.mode(AppColors.info, BlendMode.srcIn),
        ),
        SizedBox(width: 8.w),
        Text(
          'Task Details',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
