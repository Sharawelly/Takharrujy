import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';

class FileUploadArea extends StatelessWidget {
  final VoidCallback? onBrowseFiles;

  const FileUploadArea({super.key, this.onBrowseFiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              'Upload Files',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              ' *',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Upload Area
        Container(
          width: double.infinity,

          height: 190.h,
          decoration: BoxDecoration(
            color: AppColors.backgroundGrey,
            border: Border.all(
              color: AppColors.border,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upload Icon
              SvgPicture.asset(
                AppImages.uploadDeliverable,
                width: 45.w,
                height: 36.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryDark,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 16.h),

              // Upload Text
              Text(
                'Tap to select files',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 16.h),

              // Browse Files Button
              GestureDetector(
                onTap: onBrowseFiles,
                child: Container(
                  width: double.infinity,
                  height: 38.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      'Browse Files',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // File Types Info
              Text(
                'PDF, DOC, DOCX, TXT, ZIP (Max 50MB)',
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
