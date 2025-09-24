import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/community_project_model.dart';
import 'community_project_header.dart';
import 'community_project_details.dart';
import 'community_project_actions.dart';

class CommunityProjectCard extends StatelessWidget {
  final CommunityProjectModel project;
  final VoidCallback? onJoinPressed;
  final VoidCallback? onViewPressed;

  const CommunityProjectCard({
    super.key,
    required this.project,
    this.onJoinPressed,
    this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommunityProjectHeader(project: project),
          SizedBox(height: 12.h),
          _buildDescription(),
          SizedBox(height: 16.h),
          CommunityProjectDetails(project: project),
          SizedBox(height: 16.h),
          CommunityProjectActions(
            project: project,
            onJoinPressed: onJoinPressed,
            onViewPressed: onViewPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      project.description,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
