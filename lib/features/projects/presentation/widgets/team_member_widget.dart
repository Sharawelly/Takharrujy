import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';

class TeamMember {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final bool isLeader;

  const TeamMember({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.isLeader = false,
  });

  TeamMember copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    bool? isLeader,
  }) {
    return TeamMember(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      isLeader: isLeader ?? this.isLeader,
    );
  }
}

class TeamMemberWidget extends StatefulWidget {
  final List<TeamMember> teamMembers;
  final ValueChanged<List<TeamMember>> onTeamMembersChanged;
  final VoidCallback? onAddMember;

  const TeamMemberWidget({
    super.key,
    required this.teamMembers,
    required this.onTeamMembersChanged,
    this.onAddMember,
  });

  @override
  State<TeamMemberWidget> createState() => _TeamMemberWidgetState();
}

class _TeamMemberWidgetState extends State<TeamMemberWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Team Members *',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),

        // Team Members Container
        Container(
          width: 324.w,
          padding: EdgeInsets.all(13.w),
          decoration: BoxDecoration(
            color: AppColors.backgroundGrey,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              // Existing Team Members
              ...widget.teamMembers.map(
                (member) => _buildTeamMemberItem(member),
              ),
              SizedBox(height: 12.h),

              // Add Team Member Button
              _buildAddMemberButton(),
            ],
          ),
        ),
        SizedBox(height: 8.h),

        // Helper Text
        Text(
          'Maximum 4 members per team',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTeamMemberItem(TeamMember member) {
    return Container(
      width: 298.w,
      height: 38.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2FE),
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 8.r,
              backgroundColor: const Color(0xFF0369A1),
              child: member.avatar != null
                  ? ClipOval(
                      child: Image.asset(
                        member.avatar!,
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/person.svg',
                      width: 10.w,
                      height: 10.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
            SizedBox(width: 12.w),

            // Member Name
            Expanded(
              child: Text(
                member.name,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF0369A1),
                ),
              ),
            ),

            // Leader Badge
            if (member.isLeader)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: Text(
                  'Leader',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),

            // Remove Button
            if (!member.isLeader) // Don't allow removing the leader
              GestureDetector(
                onTap: () => _removeMember(member),
                child: SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/delete.svg',
                      width: 12.w,
                      height: 12.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF6B7280),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddMemberButton() {
    return GestureDetector(
      onTap: widget.teamMembers.length >= 4 ? null : _addMember,
      child: Container(
        width: 298.w,
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/new_task.svg',
              width: 12.25.w,
              height: 14.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF4B5563),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'Add Team Member',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMember() {
    // TODO: Implement add member functionality
    // For now, add a sample member
    final newMember = TeamMember(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'New Member ${widget.teamMembers.length}',
      email: 'member${widget.teamMembers.length}@example.com',
    );

    final updatedMembers = List<TeamMember>.from(widget.teamMembers);
    updatedMembers.add(newMember);
    widget.onTeamMembersChanged(updatedMembers);
  }

  void _removeMember(TeamMember member) {
    final updatedMembers = List<TeamMember>.from(widget.teamMembers);
    updatedMembers.removeWhere((m) => m.id == member.id);
    widget.onTeamMembersChanged(updatedMembers);
  }
}
