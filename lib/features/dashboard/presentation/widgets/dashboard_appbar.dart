import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onAvatarPressed;

  const DashboardAppBar({
    super.key,
    this.onMenuPressed,
    this.onNotificationPressed,
    this.onAvatarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            // Menu Button
            GestureDetector(
              onTap: onMenuPressed,
              child: Container(
                width: 30.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.menu,
                  color: AppColors.textSecondary,
                  size: 16.w,
                ),
              ),
            ),
            SizedBox(width: 16.w),

            // Title
            Expanded(
              child: Center(
                child: Text(
                  'Dashboard',
                  style: AppTextStyles.titleSmall.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1F2937),
                    height: 1.19,
                  ),
                ),
              ),
            ),

            // Right Actions
            Row(
              children: [
                // Notification Button
                Stack(
                  children: [
                    GestureDetector(
                      onTap: onNotificationPressed,
                      child: Container(
                        width: 28.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: AppColors.textSecondary,
                          size: 14.w,
                        ),
                      ),
                    ),
                    // Notification Badge
                    Positioned(
                      right: 0,
                      top: -4.h,
                      child: Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEF4444),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8.w),

                // Avatar
                GestureDetector(
                  onTap: onAvatarPressed,
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5E7EB), // Placeholder color
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/user_avatar.png',
                        width: 32.w,
                        height: 32.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE5E7EB),
                            ),
                            child: Icon(
                              Icons.person,
                              color: AppColors.textTertiary,
                              size: 20.w,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(73.h);
}
