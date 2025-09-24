import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotificationsConstants.containerWidth.w,
      // height: NotificationsConstants.headerHeight.h,
      padding: EdgeInsets.symmetric(
        horizontal: NotificationsConstants.padding.w,
      ),
      child: _buildSubtitle(),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      NotificationsConstants.notificationsSubtitle,
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: NotificationsConstants.subtitleFontSize.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: NotificationsConstants.subtitleLineHeight,
      ),
    );
  }
}
