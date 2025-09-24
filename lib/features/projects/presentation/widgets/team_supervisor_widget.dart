import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/team_member_model.dart';

class TeamSupervisorWidget extends StatelessWidget {
  final String supervisorName;
  final String supervisorDepartment;
  final List<TeamMemberModel> teamMembers;

  const TeamSupervisorWidget({
    super.key,
    required this.supervisorName,
    required this.supervisorDepartment,
    required this.teamMembers,
  });

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
          // Title
          Text(
            'Team & Supervisor',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),

          // Supervisor Section
          _buildSupervisorSection(),
          SizedBox(height: 20.h),

          // Team Members Section
          _buildTeamMembersSection(),
        ],
      ),
    );
  }

  Widget _buildSupervisorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Supervisor Label
        Text(
          'Supervisor',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),

        // Supervisor Card
        Container(
          width: 324.w,
          height: 72.h,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.backgroundGrey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 24.r,
                backgroundColor: const Color(0xFF0369A1),
                child: SvgPicture.asset(
                  'assets/images/person.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Supervisor Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      supervisorName,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      supervisorDepartment,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Message Button
              Container(
                width: 32.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/new_message.svg',
                    width: 16.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF9CA3AF),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamMembersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Team Members Label
        Text(
          'Team Members (${teamMembers.length})',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),

        // Team Members List
        Column(
          children: teamMembers
              .map((member) => _buildTeamMemberCard(member))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildTeamMemberCard(TeamMemberModel member) {
    return Container(
      width: 324.w,
      height: 64.h,
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xFF0369A1),
            child: member.avatar != null
                ? ClipOval(
                    child: Image.asset(
                      member.avatar!,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.cover,
                    ),
                  )
                : SvgPicture.asset(
                    'assets/images/person.svg',
                    width: 20.w,
                    height: 20.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
          ),
          SizedBox(width: 12.w),

          // Member Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  member.name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  member.role.displayName,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Status Indicator
          Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: _getStatusColor(member.status),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(TeamMemberStatus status) {
    switch (status) {
      case TeamMemberStatus.online:
        return const Color(0xFF4ADE80);
      case TeamMemberStatus.away:
        return const Color(0xFFFACC15);
      case TeamMemberStatus.offline:
        return AppColors.textTertiary;
    }
  }
}
