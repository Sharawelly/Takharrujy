import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/project_model.dart';

class ProjectDetailsCardWidget extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(17.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: AppTextStyles.titleLarge.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      project.description,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Handle menu action
                },
                icon: SvgPicture.asset(
                  'assets/images/more_vertical.svg',
                  width: 4.w,
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF9CA3AF),
                    BlendMode.srcIn,
                  ),
                ),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 20.w, minHeight: 40.h),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Status and Due Date
          Row(
            children: [
              Expanded(
                child: _buildInfoSection(
                  label: 'Status',
                  value: project.status.displayName,
                  valueColor: _getStatusColor(project.status),
                  backgroundColor: _getStatusBackgroundColor(project.status),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildInfoSection(
                  label: 'Due Date',
                  value: _formatDate(project.dueDate),
                  valueColor: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Progress
          _buildProgressSection(project.progress),
          SizedBox(height: 20.h),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  text: 'Edit Project',
                  iconPath: 'assets/images/edit_project.svg',
                  isPrimary: true,
                  onTap: () {
                    // TODO: Navigate to edit project
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildActionButton(
                  text: 'Share',
                  iconPath: 'assets/images/share.svg',
                  isPrimary: false,
                  onTap: () {
                    // TODO: Handle share
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required String label,
    required String value,
    required Color valueColor,
    Color? backgroundColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: backgroundColor != null
              ? EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h)
              : EdgeInsets.zero,
          decoration: backgroundColor != null
              ? BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(9999.r),
                )
              : null,
          child: Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection(double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(9999.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              '${progress.toInt()}%',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required String iconPath,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : Colors.white,
          border: isPrimary ? null : Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 14.w,
                height: 14.h,
                colorFilter: ColorFilter.mode(
                  isPrimary ? Colors.white : AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: isPrimary ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.planning:
        return AppColors.textSecondary;
      case ProjectStatus.inProgress:
        return AppColors.black;
      case ProjectStatus.completed:
        return AppColors.black;
      case ProjectStatus.onHold:
        return AppColors.textSecondary;
    }
  }

  Color _getStatusBackgroundColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.planning:
        return const Color(0xFFF3F4F6);
      case ProjectStatus.inProgress:
        return const Color(0xFFFEF3C7);
      case ProjectStatus.completed:
        return const Color(0xFFDCFCE7);
      case ProjectStatus.onHold:
        return const Color(0xFFF3F4F6);
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
