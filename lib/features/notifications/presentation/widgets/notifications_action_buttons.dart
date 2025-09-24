import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:takharrujy/core/constants/constants.dart';
import 'notification_action_button.dart';

class NotificationsActionButtons extends StatelessWidget {
  final VoidCallback onFilterPressed;
  final VoidCallback onMarkAllReadPressed;

  const NotificationsActionButtons({
    super.key,
    required this.onFilterPressed,
    required this.onMarkAllReadPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: NotificationsConstants.containerWidth.w,
      child: Row(
        children: [
          NotificationActionButton(
            text: NotificationsConstants.filterButtonText,
            iconPath: AppImages.filter,
            backgroundColor: AppColors.primary,
            iconColor: AppColors.onPrimary,
            textColor: AppColors.onPrimary,
            onPressed: onFilterPressed,
            width: 155.w,
            height: 70.h,
          ),
          Spacer(),
          NotificationActionButton(
            text: NotificationsConstants.markAllReadButtonText,
            iconPath: AppImages.completedTask,
            backgroundColor: AppColors.surface,
            iconColor: AppColors.success,
            textColor: AppColors.textPrimary,
            onPressed: onMarkAllReadPressed,
            width: 155.w,
            height: 70.h,
            hasBorder: true,
          ),
        ],
      ),
    );
  }
}
