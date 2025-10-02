import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'package:takharrujy/core/constants/constants.dart';

class CommunityFilterSection extends StatelessWidget {
  final String selectedFaculty;
  final String selectedDepartment;
  final String selectedStatus;
  final ValueChanged<String?> onFacultyChanged;
  final ValueChanged<String?> onDepartmentChanged;
  final ValueChanged<String?> onStatusChanged;
  final VoidCallback onSearchPressed;

  const CommunityFilterSection({
    super.key,
    required this.selectedFaculty,
    required this.selectedDepartment,
    required this.selectedStatus,
    required this.onFacultyChanged,
    required this.onDepartmentChanged,
    required this.onStatusChanged,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterDropdown(
            key: const Key('facultyDropdown'),
            label: CommunityConstants.facultyLabel,
            value: selectedFaculty,
            items: CommunityConstants.facultyOptions,
            onChanged: onFacultyChanged,
          ),
          SizedBox(height: 16.h),
          _buildFilterDropdown(
            key: const Key('departmentDropdown'),
            label: CommunityConstants.departmentLabel,
            value: selectedDepartment,
            items: CommunityConstants.departmentOptions,
            onChanged: onDepartmentChanged,
          ),
          SizedBox(height: 16.h),
          _buildFilterDropdown(
            key: const Key('statusDropdown'),
            label: CommunityConstants.statusLabel,
            value: selectedStatus,
            items: CommunityConstants.statusOptions,
            onChanged: onStatusChanged,
          ),
          SizedBox(height: 24.h),
          _buildSearchButton(),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown({
    required Key key,
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.surface,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              key: key,
              value: value,
              onChanged: onChanged,
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      item,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
                size: 20.w,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton() {
    return GestureDetector(
      key: const Key('searchProjectsButton'),
      onTap: onSearchPressed,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, color: AppColors.white, size: 18.w),
              SizedBox(width: 8.w),
              Text(
                'Search Projects',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
