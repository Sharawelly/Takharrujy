import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/community_project_model.dart';

class CommunityProjectHeader extends StatelessWidget {
  final CommunityProjectModel project;

  const CommunityProjectHeader({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            project.title,
            style: AppTextStyles.titleLarge.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ),
        _buildStatusTag(project.status),
      ],
    );
  }

  Widget _buildStatusTag(ProjectStatus status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case ProjectStatus.open:
        backgroundColor = AppColors.success;
        textColor = Colors.white;
        break;
      case ProjectStatus.full:
        backgroundColor = AppColors.textSecondary;
        textColor = Colors.white;
        break;
      case ProjectStatus.closed:
        backgroundColor = AppColors.error;
        textColor = Colors.white;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        status.displayName,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
