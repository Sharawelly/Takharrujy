import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class PreferencesTab extends StatelessWidget {
  const PreferencesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preferences',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 20.h),

          // This would contain preference settings
          // For now, showing a placeholder
          Center(
            child: Text(
              'Preference settings will be implemented here',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                color: const Color(0xFF64748B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
