import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';

class TaskFormHeader extends StatelessWidget {
  final bool isEditMode;

  const TaskFormHeader({super.key, required this.isEditMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
        child: Row(
          children: [
            Container(
              width: 18.w,
              height: 18.h,
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.createNewTask,
                  width: 12.w,
                  height: 12.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              isEditMode ? 'Edit Task' : 'Create New Task',
              style: AppTextStyles.titleMedium.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
