import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_images.dart';
import 'file_upload_widget.dart';

class SubmitWorkCard extends StatelessWidget {
  final List<UploadedFile> uploadedFiles;
  final ValueChanged<List<UploadedFile>> onFilesChanged;
  final VoidCallback onBrowseFiles;
  final TextEditingController notesController;
  final TextEditingController statusController;
  final ValueChanged<String?> onStatusChanged;

  const SubmitWorkCard({
    super.key,
    required this.uploadedFiles,
    required this.onFilesChanged,
    required this.onBrowseFiles,
    required this.notesController,
    required this.statusController,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 805.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Submit Your Work',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 16.h),

              // File Upload
              FileUploadWidget(
                uploadedFiles: uploadedFiles,
                onFilesChanged: onFilesChanged,
                onBrowseFiles: onBrowseFiles,
              ),
              SizedBox(height: 16.h),

              // Submission Notes
              _buildSubmissionNotes(),
              SizedBox(height: 16.h),

              // Mark Task As
              _buildMarkTaskAs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmissionNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Submission Notes',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),

        // Text Area
        TextField(
          controller: notesController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Add any notes or comments about your\nsubmission...',
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textHint,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16.w),
          ),
        ),
        SizedBox(height: 8.h),

        // Helper Text
        Text(
          'Optional: Provide additional context',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildMarkTaskAs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              'Mark Task as',
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

        // Dropdown
        Container(
          width: double.infinity,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: statusController.text.isEmpty
                  ? null
                  : statusController.text,
              isExpanded: true,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              items: [
                const DropdownMenuItem<String>(
                  value: null,
                  child: Text('Select Status'),
                ),
                const DropdownMenuItem<String>(
                  value: 'completed',
                  child: Text('Completed'),
                ),
                const DropdownMenuItem<String>(
                  value: 'in_review',
                  child: Text('In Review'),
                ),
                const DropdownMenuItem<String>(
                  value: 'needs_revision',
                  child: Text('Needs Revision'),
                ),
              ],
              onChanged: onStatusChanged,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
              ),
              icon: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: SvgPicture.asset(
                  AppImages.filter,
                  width: 29.w,
                  height: 29.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
