import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';

class AccountStatusCard extends StatelessWidget {
  const AccountStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(21.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Account Status',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 20.h),

          // Email Verified
          _buildStatusRow(
            label: 'Email Verified',
            status: 'Verified',
            isVerified: true,
          ),
          SizedBox(height: 12.h),

          // Account Status
          _buildStatusRow(
            label: 'Account Status',
            status: 'Active',
            isVerified: false,
          ),
          SizedBox(height: 12.h),

          // Member Since
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Member Since',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475569),
                ),
              ),
              Text(
                'Jan 2025',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow({
    required String label,
    required String status,
    required bool isVerified,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF475569),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: isVerified
                ? const Color(0xFFDCFCE7)
                : const Color(0xFFDBEAFE),
            borderRadius: BorderRadius.circular(9999.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isVerified) ...[
                SvgPicture.asset(
                  'assets/images/completed_task.svg',
                  width: 10.5.w,
                  height: 12.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF166534),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 4.w),
              ],
              Text(
                status,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: isVerified
                      ? const Color(0xFF166534)
                      : const Color(0xFF1E40AF),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
