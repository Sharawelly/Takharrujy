import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class AiFileUploadSection extends StatelessWidget {
  final VoidCallback? onUpload;

  const AiFileUploadSection({super.key, this.onUpload});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AiAssistantConstants.attachFilesLabel,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onUpload,
          child: Container(
            width: 324.w,
            height: 124.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.border,
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload, size: 30.w, color: AppColors.grey500),
                SizedBox(height: 8.h),
                Text(
                  AiAssistantConstants.uploadHintText,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  AiAssistantConstants.uploadSubtext,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
