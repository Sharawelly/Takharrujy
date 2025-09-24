import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class MessagesSearchSection extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String>? onSearchChanged;

  const MessagesSearchSection({
    super.key,
    required this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MessagesConstants.containerWidth.w,
      height: MessagesConstants.searchHeight.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundGrey,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Padding(
        padding: EdgeInsets.all(MessagesConstants.padding.w),
        child: _buildSearchField(),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: MessagesConstants.searchHintText,
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          fontSize: MessagesConstants.searchHintFontSize.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textHint,
          height: MessagesConstants.searchHintLineHeight,
        ),
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
      ),
    );
  }
}
