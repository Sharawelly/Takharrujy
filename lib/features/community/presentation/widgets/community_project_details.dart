import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/community_project_model.dart';

class CommunityProjectDetails extends StatelessWidget {
  final CommunityProjectModel project;

  const CommunityProjectDetails({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                icon: 'assets/images/team.svg',
                iconBgColor: const Color(0xFFDBEAFE),
                iconColor: const Color(0xFF2563EB),
                text: '${project.currentMembers}/${project.maxMembers} Members',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildDetailItem(
                icon: 'assets/images/building.svg',
                iconBgColor: const Color(0xFFDCFCE7),
                iconColor: AppColors.success,
                text: project.department,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                icon: project.supervisorStatus == ProjectAvailability.available
                    ? 'assets/images/person.svg'
                    : 'assets/images/warning.svg',
                iconBgColor:
                    project.supervisorStatus == ProjectAvailability.available
                    ? const Color(0xFFF3E8FF)
                    : const Color(0xFFFEF9C3),
                iconColor:
                    project.supervisorStatus == ProjectAvailability.available
                    ? const Color(0xFF9333EA)
                    : const Color(0xFFCA8A04),
                text: project.supervisorStatus == ProjectAvailability.available
                    ? project.supervisor
                    : 'Not Assigned',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildDetailItem(
                icon: 'assets/images/calendar.svg',
                iconBgColor: const Color(0xFFFFEDD5),
                iconColor: AppColors.warning,
                text: _formatDate(project.dueDate),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required String icon,
    required Color iconBgColor,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Icon(_getIconData(icon), size: 14.w, color: iconColor),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  IconData _getIconData(String iconPath) {
    if (iconPath.contains('team')) return Icons.group;
    if (iconPath.contains('building')) return Icons.business;
    if (iconPath.contains('person')) return Icons.person;
    if (iconPath.contains('warning')) return Icons.warning;
    if (iconPath.contains('calendar')) return Icons.calendar_today;
    return Icons.info;
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
