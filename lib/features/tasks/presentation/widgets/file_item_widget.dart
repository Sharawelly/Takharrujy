import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import 'file_upload_widget.dart';

class FileItemWidget extends StatelessWidget {
  final UploadedFile file;
  final VoidCallback onRemove;

  const FileItemWidget({super.key, required this.file, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      height: 66.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            // File Icon
            _buildFileIcon(file.type),
            SizedBox(width: 12.w),

            // File Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    file.name,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    file.size,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Remove Button
            GestureDetector(
              onTap: onRemove,
              child: SizedBox(
                width: 26.5.w,
                height: 40.h,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/delete.svg',
                    width: 10.5.w,
                    height: 14.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF9CA3AF),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileIcon(String type) {
    Color iconColor;
    Widget icon;

    switch (type.toLowerCase()) {
      case 'pdf':
        iconColor = AppColors.error;
        icon = Container(
          width: 18.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Center(
            child: Text(
              'PDF',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
        break;
      case 'doc':
      case 'docx':
        iconColor = AppColors.info;
        icon = Container(
          width: 13.5.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Center(
            child: Text(
              'DOC',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 6.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
        break;
      default:
        iconColor = AppColors.textSecondary;
        icon = Container(
          width: 18.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Center(
            child: Text(
              'FILE',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 6.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
    }

    return icon;
  }
}
