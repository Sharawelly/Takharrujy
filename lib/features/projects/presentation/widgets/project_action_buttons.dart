import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';
import 'project_secondary_button.dart';

class ProjectActionButtons extends StatelessWidget {
  final VoidCallback onCreateProject;
  final VoidCallback onResetForm;
  final VoidCallback onSaveDraft;

  const ProjectActionButtons({
    super.key,
    required this.onCreateProject,
    required this.onResetForm,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Create Project Button
        SizedBox(
          width: double.infinity,
          height: 80.h,
          child: ElevatedButton(
            onPressed: onCreateProject,
            style:
                ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ).copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                ),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.newTask,
                      width: 14.w,
                      height: 16.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.onPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Create Project',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),

        // Secondary Buttons
        Row(
          children: [
            ProjectSecondaryButton(text: 'Reset Form', onPressed: onResetForm),
            SizedBox(width: 12.w),
            ProjectSecondaryButton(text: 'Save Draft', onPressed: onSaveDraft),
          ],
        ),
      ],
    );
  }
}
