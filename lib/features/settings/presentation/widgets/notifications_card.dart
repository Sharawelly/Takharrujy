import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'settings_toggle_section.dart';

class NotificationsCard extends StatelessWidget {
  final bool emailNotifications;
  final bool pushNotifications;
  final bool taskDeadlines;
  final bool newMessages;
  final bool supervisorFeedback;
  final ValueChanged<bool> onEmailNotificationsChanged;
  final ValueChanged<bool> onPushNotificationsChanged;
  final ValueChanged<bool> onTaskDeadlinesChanged;
  final ValueChanged<bool> onNewMessagesChanged;
  final ValueChanged<bool> onSupervisorFeedbackChanged;

  const NotificationsCard({
    super.key,
    required this.emailNotifications,
    required this.pushNotifications,
    required this.taskDeadlines,
    required this.newMessages,
    required this.supervisorFeedback,
    required this.onEmailNotificationsChanged,
    required this.onPushNotificationsChanged,
    required this.onTaskDeadlinesChanged,
    required this.onNewMessagesChanged,
    required this.onSupervisorFeedbackChanged,
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
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.notification,
                    width: 14.w,
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
                'Notifications',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Notification toggles
          SettingsToggleSection(
            title: 'Email Notifications',
            description: 'Receive notifications via email',
            value: emailNotifications,
            onChanged: onEmailNotificationsChanged,
          ),
          SizedBox(height: 16.h),

          SettingsToggleSection(
            title: 'Push Notifications',
            description: 'Browser push notifications',
            value: pushNotifications,
            onChanged: onPushNotificationsChanged,
          ),
          SizedBox(height: 16.h),

          SettingsToggleSection(
            title: 'Task Deadlines',
            description: 'Upcoming deadline alerts',
            value: taskDeadlines,
            onChanged: onTaskDeadlinesChanged,
          ),
          SizedBox(height: 16.h),

          SettingsToggleSection(
            title: 'New Messages',
            description: 'Message notifications',
            value: newMessages,
            onChanged: onNewMessagesChanged,
          ),
          SizedBox(height: 16.h),

          SettingsToggleSection(
            title: 'Supervisor Feedback',
            description: 'Feedback notifications',
            value: supervisorFeedback,
            onChanged: onSupervisorFeedbackChanged,
          ),
        ],
      ),
    );
  }
}
