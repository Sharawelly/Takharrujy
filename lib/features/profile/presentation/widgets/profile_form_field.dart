import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';

class ProfileFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double width;
  final String? helperText;
  final String? hintText;
  final bool enabled;
  final bool obscureText;
  final int? maxLines;
  final TextInputType? keyboardType;

  const ProfileFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.width,
    this.helperText,
    this.hintText,
    this.enabled = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF334155),
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: double.infinity,
          height: maxLines == 1 ? 42.h : null,
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            obscureText: obscureText,
            maxLines: maxLines,
            keyboardType: keyboardType,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: enabled ? Colors.black : const Color(0xFF475569),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                color: const Color(0xFFADAEBC),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: maxLines == 1 ? 10.h : 12.h,
              ),
              filled: true,
              fillColor: enabled ? Colors.white : const Color(0xFFF8FAFC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: enabled
                      ? const Color(0xFFCBD5E1)
                      : const Color(0xFFE2E8F0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: enabled
                      ? const Color(0xFFCBD5E1)
                      : const Color(0xFFE2E8F0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFF0EA5E9)),
              ),
            ),
          ),
        ),
        if (helperText != null) ...[
          SizedBox(height: 4.h),
          Text(
            helperText!,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ],
    );
  }
}

class ProfileDropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const ProfileDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF334155),
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          height: 41.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFCBD5E1)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 0,
              ),
              border: InputBorder.none,
            ),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
