import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class CommunityProjectListHeader extends StatelessWidget {
  final int projectCount;
  final String selectedSort;
  final VoidCallback onSortPressed;

  const CommunityProjectListHeader({
    super.key,
    required this.projectCount,
    required this.selectedSort,
    required this.onSortPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Found $projectCount projects',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const Spacer(),
        _buildSortButton(),
      ],
    );
  }

  Widget _buildSortButton() {
    return GestureDetector(
      onTap: onSortPressed,
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.surface,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedSort,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.textSecondary,
              size: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
