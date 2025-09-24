import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';

class ProfileCard extends StatelessWidget {
  final VoidCallback onChangePhoto;

  const ProfileCard({super.key, required this.onChangePhoto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 276.h,
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        color: AppColors.surface, // Semi-transparent white
        border: Border.all(
          color: AppColors.border, // Semi-transparent border
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          // Profile Image Section
          Stack(
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  border: Border.all(color: AppColors.primaryLight, width: 4.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowLight,
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: AppColors.shadowLight,
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border.all(
                        color: AppColors.primaryLight,
                        width: 2.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppImages.person,
                        width: 36.w,
                        height: 36.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Online Status Indicator
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    border: Border.all(color: AppColors.surface, width: 2.w),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h),

          // Name
          Text(
            'Marawan',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),

          // Role
          Text(
            'Student',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 4.h),

          // University
          Text(
            'University of Technology',
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 16.h),

          // Change Photo Button
          Container(
            width: 148.64.w,
            height: 36.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.primaryLight, AppColors.primary],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ElevatedButton(
              onPressed: onChangePhoto,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppImages.changePhoto,
                    width: 18.w,
                    height: 18.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Text(
                      'Change Photo',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
