import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';

class NotificationsNotificationIcon extends StatelessWidget {
  final NotificationType type;

  const NotificationsNotificationIcon({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final iconData = _getIconData();
    return Container(
      width: NotificationsConstants.iconSize.w,
      height: NotificationsConstants.iconSize.h,
      decoration: BoxDecoration(
        color: iconData.backgroundColor,
        borderRadius: BorderRadius.circular(
          NotificationsConstants.smallBorderRadius.r,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconData.iconPath,
          width: NotificationsConstants.smallIconSize.w,
          height: NotificationsConstants.smallIconSize.h,
          colorFilter: ColorFilter.mode(iconData.iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }

  _IconData _getIconData() {
    switch (type) {
      case NotificationType.deadline:
        return _IconData(
          backgroundColor: AppColors.errorLight,
          iconColor: AppColors.error,
          iconPath: AppImages.projectDeadline,
        );
      case NotificationType.approval:
        return _IconData(
          backgroundColor: AppColors.successLight,
          iconColor: AppColors.success,
          iconPath: AppImages.completedTask,
        );
      case NotificationType.message:
        return _IconData(
          backgroundColor: AppColors.primaryLight,
          iconColor: AppColors.primary,
          iconPath: AppImages.newMessage,
        );
      case NotificationType.task:
        return _IconData(
          backgroundColor: AppColors.warningLight,
          iconColor: AppColors.warningDark,
          iconPath: AppImages.newTask,
        );
      case NotificationType.announcement:
        return _IconData(
          backgroundColor: AppColors.grey100,
          iconColor: AppColors.textSecondary,
          iconPath: AppImages.systemAnnouncement,
        );
    }
  }
}

class _IconData {
  final Color backgroundColor;
  final Color iconColor;
  final String iconPath;

  _IconData({
    required this.backgroundColor,
    required this.iconColor,
    required this.iconPath,
  });
}
