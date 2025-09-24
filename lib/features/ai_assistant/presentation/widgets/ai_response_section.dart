import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/ai_response_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'ai_section_header.dart';
import 'ai_action_button.dart';

class AiResponseSection extends StatelessWidget {
  final AiResponseModel aiResponse;
  final VoidCallback onMarkHelpful;
  final VoidCallback onCopyResponse;
  final VoidCallback onShareResponse;
  final VoidCallback onHandleSchemaQuestions;

  const AiResponseSection({
    super.key,
    required this.aiResponse,
    required this.onMarkHelpful,
    required this.onCopyResponse,
    required this.onShareResponse,
    required this.onHandleSchemaQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 390.h,
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
          Row(
            children: [
              Expanded(
                child: AiSectionHeader(
                  iconPath: AppImages.aiResponse,
                  title: AiAssistantConstants.aiResponseTitle,
                  gradientColors: const [
                    AppColors.success,
                    AppColors.successDark,
                  ],
                ),
              ),
              Text(
                aiResponse.formattedTimestamp,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildResponseContent(),
          SizedBox(height: 16.h),
          _buildResponseActions(),
        ],
      ),
    );
  }

  Widget _buildResponseContent() {
    return Container(
      width: 324.w,
      height: 262.h,
      padding: EdgeInsets.all(AiAssistantConstants.cardPadding.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryLight, AppColors.primaryLight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(color: AppColors.infoLight),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.ai,
                    width: 17.w,
                    height: 14.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  aiResponse.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Expanded(child: _buildResponseSteps()),
          SizedBox(height: 12.h),
          _buildResponseLink(),
        ],
      ),
    );
  }

  Widget _buildResponseSteps() {
    return Container(
      width: 290.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AiAssistantConstants.responseStepsTitle,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              itemCount: aiResponse.content.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '•',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.info,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          aiResponse.content[index],
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponseLink() {
    return GestureDetector(
      onTap: onHandleSchemaQuestions,
      child: Text(
        AiAssistantConstants.schemaQuestionsText,
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }

  Widget _buildResponseActions() {
    return Row(
      children: [
        AiActionButton(
          label: AiAssistantConstants.helpfulButtonText,
          onTap: onMarkHelpful,
        ),
        SizedBox(width: 8.w),
        AiActionButton(
          label: AiAssistantConstants.copyButtonText,
          onTap: onCopyResponse,
        ),
        SizedBox(width: 8.w),
        AiActionButton(
          label: AiAssistantConstants.shareButtonText,
          onTap: onShareResponse,
        ),
      ],
    );
  }
}
