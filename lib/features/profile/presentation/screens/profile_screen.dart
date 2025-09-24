import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
// import '../../../../core/widgets/navigation_drawer.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_card.dart';
import '../widgets/account_status_card.dart';
import '../widgets/tabbed_content.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Profile',
        showAvatar: true,
        showNotifications: true,
        onNotificationPressed: () => context.push('/notifications'),
        onProfilePressed: () => context.push('/profile'),
        onSettingsPressed: () => context.push('/settings'),
        avatarImage: AppImages.sara,
      ),
      // drawer: const CustomNavigationDrawer(currentRoute: '/profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),

            // Profile Header
            const ProfileHeader(),
            SizedBox(height: 16.h),

            // Profile Card
            ProfileCard(onChangePhoto: _changePhoto),
            SizedBox(height: 16.h),

            // Account Status Card
            const AccountStatusCard(),
            SizedBox(height: 16.h),

            // Tabbed Content
            const TabbedContent(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  void _changePhoto() {
    // TODO: Implement photo change functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Photo change functionality will be implemented'),
        backgroundColor: Color(0xFF0284C7),
      ),
    );
  }
}
