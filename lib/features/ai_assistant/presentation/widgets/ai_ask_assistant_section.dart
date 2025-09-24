import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'ai_dropdown_field.dart';
import 'ai_text_area_field.dart';
import 'ai_file_upload_section.dart';
import 'ai_section_header.dart';

class AiAskAssistantSection extends StatelessWidget {
  final String selectedAssistanceType;
  final TextEditingController questionController;
  final ValueChanged<String> onAssistanceTypeChanged;
  final VoidCallback onUploadFiles;
  final VoidCallback onGetHelp;
  final VoidCallback onClearForm;
  final bool isProcessing;

  const AiAskAssistantSection({
    super.key,
    required this.selectedAssistanceType,
    required this.questionController,
    required this.onAssistanceTypeChanged,
    required this.onUploadFiles,
    required this.onGetHelp,
    required this.onClearForm,
    this.isProcessing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 565.h,
      padding: EdgeInsets.all(AiAssistantConstants.cardPadding.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(
          AiAssistantConstants.borderRadius.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AiSectionHeader(
            iconPath: AppImages.ai,
            title: AiAssistantConstants.askAiAssistantTitle,
            gradientColors: const [AppColors.warning, AppColors.warningDark],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AiDropdownField(
                  label: AiAssistantConstants.typeOfAssistanceLabel,
                  value: selectedAssistanceType,
                  items: AiAssistantConstants.assistanceTypes,
                  onChanged: (value) {
                    onAssistanceTypeChanged(value!);
                  },
                ),
                SizedBox(height: 16.h),
                AiTextAreaField(
                  label: AiAssistantConstants.yourQuestionLabel,
                  controller: questionController,
                  hintText: AiAssistantConstants.questionHintText,
                  maxLines: 4,
                ),
                SizedBox(height: 8.h),
                _buildHelperText(),
                SizedBox(height: 16.h),
                AiFileUploadSection(onUpload: onUploadFiles),
                SizedBox(height: 16.h),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelperText() {
    return Row(
      children: [
        Icon(Icons.lightbulb, size: 12.w, color: AppColors.warning),
        SizedBox(width: 4.w),
        Text(
          AiAssistantConstants.beSpecificText,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onClearForm,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFD1D5DB)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            child: Text(
              AiAssistantConstants.clearButtonText,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: isProcessing ? null : onGetHelp,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            child: isProcessing
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    AiAssistantConstants.getHelpButtonText,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
