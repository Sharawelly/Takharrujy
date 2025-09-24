import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../theme/text_styles.dart';
import 'custom_appbar.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String iconPath;
  final String description;
  final String route;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.iconPath,
    required this.description,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: StandardAppBar(
        title: title,
        showNotifications: true,
        showAvatar: true,
        onNotificationPressed: null,
        avatarImage: 'assets/images/person.svg',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF0284C7),
                  borderRadius: BorderRadius.circular(60.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 60.w,
                    height: 60.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF0284C7),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                title,
                style: AppTextStyles.headlineMedium.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                description,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFFF3F4F6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.construction_outlined,
                      size: 48.w,
                      color: const Color(0xFF6B7280),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Coming Soon',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'This feature is under development and will be available in a future update.',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        color: const Color(0xFF6B7280),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/dashboard'),
                  icon: const Icon(Icons.home_outlined),
                  label: const Text('Go to Dashboard'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0284C7),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
