import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/dashboard_welcome_section.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/dashboard_current_project_card.dart';
import '../widgets/dashboard_quick_actions.dart';
import '../widgets/dashboard_recent_activity.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Dashboard',
        showNotifications: true,
        showAvatar: true,
        onNotificationPressed: () => context.push('/notifications'),
        onProfilePressed: () => context.push('/profile'),
        onSettingsPressed: () => context.push('/settings'),
        avatarImage: AppImages.sara,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            const DashboardWelcomeSection(),
            SizedBox(height: 24.h),
            const DashboardStatsGrid(),
            SizedBox(height: 16.h),
            const DashboardCurrentProjectCard(),
            SizedBox(height: 24.h),
            const DashboardQuickActions(),
            SizedBox(height: 24.h),
            const DashboardRecentActivity(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/dashboard',
      ),
    );
  }
}
