import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class DateFields extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueChanged<DateTime> onStartDateSelected;
  final ValueChanged<DateTime> onEndDateSelected;

  const DateFields({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
  });

  @override
  State<DateFields> createState() => _DateFieldsState();
}

class _DateFieldsState extends State<DateFields> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.startDate != null) {
      _startDateController.text = _formatDate(widget.startDate!);
    }
    if (widget.endDate != null) {
      _endDateController.text = _formatDate(widget.endDate!);
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Project Timeline',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              ' *',
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildDateField(
                label: 'Start Date',
                controller: _startDateController,
                keyName: 'startDateField',
                onDateSelected: widget.onStartDateSelected,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildDateField(
                label: 'End Date',
                controller: _endDateController,
                keyName: 'endDateField',
                onDateSelected: widget.onEndDateSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required String keyName,
    required ValueChanged<DateTime> onDateSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          key: Key(keyName),
          controller: controller,
          decoration: InputDecoration(
            hintText: 'YYYY-MM-DD',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onChanged: (value) {
            try {
              final date = DateTime.parse(value);
              onDateSelected(date);
            } catch (_) {

            }
          },
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }
}
