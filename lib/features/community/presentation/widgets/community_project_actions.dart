import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/community_project_model.dart';

class CommunityProjectActions extends StatelessWidget {
  final CommunityProjectModel project;
  final VoidCallback? onJoinPressed;
  final VoidCallback? onViewPressed;

  const CommunityProjectActions({
    super.key,
    required this.project,
    this.onJoinPressed,
    this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            text: project.status == ProjectStatus.open
                ? 'Request to Join'
                : 'Team Complete',
            isPrimary: project.status == ProjectStatus.open,
            onPressed: project.status == ProjectStatus.open
                ? onJoinPressed
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        _buildViewButton(),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required bool isPrimary,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      key: isPrimary
          ? Key('joinProjectButton_${project.id}')
          : Key('disabledJoinButton_${project.id}'),
      onTap: onPressed,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          gradient: isPrimary
              ? LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
              : null,
          color: isPrimary ? null : AppColors.border,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isPrimary) ...[
                Icon(Icons.add, color: AppColors.white, size: 16.w),
                SizedBox(width: 8.w),
              ],
              Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? AppColors.white : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewButton() {
    return GestureDetector(
      key: Key('viewProjectButton_${project.id}'),
      onTap: onViewPressed,
      child: Container(
        width: 44.w,
        height: 44.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.surface,
        ),
        child: Center(
          child: Icon(
            Icons.visibility_outlined,
            color: AppColors.textSecondary,
            size: 18.w,
          ),
        ),
      ),
    );
  }
}
