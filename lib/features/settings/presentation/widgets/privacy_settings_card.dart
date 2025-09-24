import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'settings_toggle_section.dart';

class PrivacySettingsCard extends StatelessWidget {
  final bool profileVisibility;
  final bool onlineStatus;
  final ValueChanged<bool> onProfileVisibilityChanged;
  final ValueChanged<bool> onOnlineStatusChanged;

  const PrivacySettingsCard({
    super.key,
    required this.profileVisibility,
    required this.onlineStatus,
    required this.onProfileVisibilityChanged,
    required this.onOnlineStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.updatePassword,
                    width: 16.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'Privacy Settings',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Privacy toggles
          SettingsToggleSection(
            title: 'Profile Visibility',
            description: 'Allow others to see your profile',
            value: profileVisibility,
            onChanged: onProfileVisibilityChanged,
          ),
          SizedBox(height: 16.h),

          SettingsToggleSection(
            title: 'Online Status',
            description: 'Show when you\'re online',
            value: onlineStatus,
            onChanged: onOnlineStatusChanged,
          ),
        ],
      ),
    );
  }
}
