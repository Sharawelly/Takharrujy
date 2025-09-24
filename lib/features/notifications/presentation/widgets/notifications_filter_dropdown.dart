import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class NotificationsFilterDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const NotificationsFilterDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.textSecondary,
        size: 16.w,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
        border: InputBorder.none,
      ),
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: NotificationsConstants.buttonFontSize.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                  height: NotificationsConstants.buttonLineHeight,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
