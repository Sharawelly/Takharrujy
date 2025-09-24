import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class AiActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;

  const AiActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultIconColor = _getDefaultIconColor(label);
    final defaultTextColor = textColor ?? Colors.black;
    final defaultBorderColor = borderColor ?? AppColors.border;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34.h,
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        decoration: BoxDecoration(
          border: Border.all(color: defaultBorderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getIconData(label),
              size: 12.w,
              color: iconColor ?? defaultIconColor,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: defaultTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String label) {
    switch (label) {
      case 'Helpful':
        return Icons.thumb_up;
      case 'Copy':
        return Icons.copy;
      case 'Share':
        return Icons.share;
      default:
        return Icons.info;
    }
  }

  Color _getDefaultIconColor(String label) {
    switch (label) {
      case 'Helpful':
        return AppColors.success;
      case 'Copy':
        return AppColors.info;
      case 'Share':
        return AppColors.secondary;
      default:
        return AppColors.textSecondary;
    }
  }
}
