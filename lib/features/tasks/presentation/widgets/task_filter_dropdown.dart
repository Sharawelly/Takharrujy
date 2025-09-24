import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';

class TaskFilterDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final String placeholder;

  const TaskFilterDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          items: [
            DropdownMenuItem<String>(value: null, child: Text(placeholder)),
            ...items.map(
              (item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)),
            ),
          ],
          onChanged: onChanged,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
          ),
          icon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: SvgPicture.asset(
              AppImages.filter,
              width: 17.w,
              height: 17.h,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
