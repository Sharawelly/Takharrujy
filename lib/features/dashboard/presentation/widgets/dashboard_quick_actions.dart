import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'quick_action_card.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DashboardConstants.quickActionsTitle,
          style: AppTextStyles.titleMedium.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.56,
          ),
        ),
        SizedBox(height: 16.h),
        _buildQuickActionCards(),
      ],
    );
  }

  Widget _buildQuickActionCards() {
    return Column(
      children: [
        QuickActionCard(
          title: DashboardConstants.createTaskTitle,
          subtitle: DashboardConstants.createTaskSubtitle,
          icon: Icons.add_circle_outline,
          iconColor: AppColors.success,
          backgroundColor: AppColors.successLight,
          onTap: _handleCreateTaskTap,
        ),
        SizedBox(height: 12.h),
        QuickActionCard(
          title: DashboardConstants.uploadDeliverableTitle,
          subtitle: DashboardConstants.uploadDeliverableSubtitle,
          icon: Icons.upload_file,
          iconColor: AppColors.secondary,
          backgroundColor: AppColors.secondaryLight,
          onTap: _handleUploadDeliverableTap,
        ),
        SizedBox(height: 12.h),
        QuickActionCard(
          title: DashboardConstants.aiAssistantTitle,
          subtitle: DashboardConstants.aiAssistantSubtitle,
          icon: Icons.smart_toy_outlined,
          iconColor: AppColors.info,
          backgroundColor: AppColors.infoLight,
          onTap: _handleAiAssistantTap,
        ),
      ],
    );
  }

  void _handleCreateTaskTap() {
    // Handle create new task
  }

  void _handleUploadDeliverableTap() {
    // Handle upload deliverable
  }

  void _handleAiAssistantTap() {
    // Handle AI assistant
  }
}
