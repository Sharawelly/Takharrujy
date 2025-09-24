import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class NotificationActionButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool hasBorder;

  const NotificationActionButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.onPressed,
    this.width,
    this.height,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 47.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: hasBorder ? Border.all(color: AppColors.border) : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 14.w,
              height: 14.h,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                  height: 1.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
