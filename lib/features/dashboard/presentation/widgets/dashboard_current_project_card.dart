import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'package:takharrujy/core/router/app_router.dart';
import 'dashboard_project_header.dart';
import 'dashboard_project_details.dart';
import 'dashboard_project_progress.dart';

class DashboardCurrentProjectCard extends StatelessWidget {
  const DashboardCurrentProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DashboardConstants.cardWidth.w,
      height: DashboardConstants.currentProjectCardHeight.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.borderVariant),
        borderRadius: BorderRadius.circular(DashboardConstants.borderRadius.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(DashboardConstants.cardPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardProjectHeader(
              onViewDetailsPressed: () => _handleViewDetailsTap(context),
            ),
            SizedBox(height: 16.h),
            _buildProjectTitle(),
            SizedBox(height: 8.h),
            _buildProjectDescription(),
            SizedBox(height: 16.h),
            const DashboardProjectDetails(),
            SizedBox(height: 16.h),
            const DashboardProjectProgress(),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectTitle() {
    return Text(
      DashboardConstants.projectTitle,
      style: AppTextStyles.titleSmall.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.19,
      ),
    );
  }

  Widget _buildProjectDescription() {
    return Text(
      DashboardConstants.projectDescription,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.21,
      ),
    );
  }

  void _handleViewDetailsTap(BuildContext context) {
    // Navigate to project overview screen
    context.go('${AppRouter.projectOverviewRoute}?projectId=1');
  }
}
