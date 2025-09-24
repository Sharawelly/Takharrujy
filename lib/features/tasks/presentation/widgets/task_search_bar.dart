import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';

class TaskSearchBar extends StatelessWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;

  const TaskSearchBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: 'Search tasks...',
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          fontSize: 14.sp,
          color: AppColors.textHint,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(16.w),
          child: Icon(AppImages.search, size: 14.w, color: AppColors.grey500),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
