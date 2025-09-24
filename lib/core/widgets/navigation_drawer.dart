import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final String currentRoute;
  final VoidCallback? onClose;

  const CustomNavigationDrawer({
    super.key,
    required this.currentRoute,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header
          _buildHeader(context),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              children: [
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/project_progress.svg',
                  title: 'Dashboard',
                  route: '/dashboard',
                  isSelected: currentRoute == '/dashboard',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/create_new_task.svg',
                  title: 'Create Project',
                  route: '/create-project',
                  isSelected: currentRoute == '/create-project',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/task_list.svg',
                  title: 'Tasks',
                  route: '/tasks',
                  isSelected: currentRoute == '/tasks',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/deliverable.svg',
                  title: 'Deliverables',
                  route: '/deliverables',
                  isSelected: currentRoute == '/deliverables',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/ai_assistant.svg',
                  title: 'AI Assistant',
                  route: '/ai-assistant',
                  isSelected: currentRoute == '/ai-assistant',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/team.svg',
                  title: 'Community',
                  route: '/community',
                  isSelected: currentRoute == '/community',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/new_message.svg',
                  title: 'Messages',
                  route: '/messages',
                  isSelected: currentRoute == '/messages',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/notification.svg',
                  title: 'Notifications',
                  route: '/notifications',
                  isSelected: currentRoute == '/notifications',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/update_password.svg',
                  title: 'Settings',
                  route: '/settings',
                  isSelected: currentRoute == '/settings',
                ),
                _buildMenuItem(
                  context: context,
                  iconPath: 'assets/images/person.svg',
                  title: 'Profile',
                  route: '/profile',
                  isSelected: currentRoute == '/profile',
                ),
              ],
            ),
          ),

          // Footer
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 24.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0284C7), Color(0xFF0369A1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Takharrujy',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Project Management System',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onClose ?? () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String iconPath,
    required String title,
    required String route,
    required bool isSelected,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
      child: Material(
        color: isSelected ? const Color(0xFFE0F2FE) : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: () {
            if (onClose != null) onClose!();
            context.go(route);
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? const Color(0xFF0284C7)
                          : const Color(0xFF6B7280),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? const Color(0xFF0284C7)
                          : const Color(0xFF374151),
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0284C7),
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: const Color(0xFFF3F4F6), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.surfaceVariant,
                child: SvgPicture.asset(
                  'assets/images/person.svg',
                  width: 20.w,
                  height: 20.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      'user@example.com',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Handle settings
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Color(0xFF6B7280),
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Handle logout
                    context.go('/signin');
                  },
                  icon: const Icon(Icons.logout, size: 16),
                  label: Text(
                    'Logout',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF6B7280),
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
