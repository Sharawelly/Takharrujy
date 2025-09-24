import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/task_model.dart';
import 'task_search_bar.dart';
import 'task_filter_dropdown.dart';

class TaskSearchFilter extends StatelessWidget {
  final String searchQuery;
  final TaskStatus? selectedStatus;
  final TaskPriority? selectedPriority;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<TaskStatus?> onStatusChanged;
  final ValueChanged<TaskPriority?> onPriorityChanged;

  const TaskSearchFilter({
    super.key,
    required this.searchQuery,
    this.selectedStatus,
    this.selectedPriority,
    required this.onSearchChanged,
    required this.onStatusChanged,
    required this.onPriorityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 133.h,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(17.w),
        child: Column(
          children: [
            // Search Bar
            TaskSearchBar(
              searchQuery: searchQuery,
              onSearchChanged: onSearchChanged,
            ),
            SizedBox(height: 12.h),

            // Filter Dropdowns
            Row(
              children: [
                // Status Filter
                Expanded(
                  child: TaskFilterDropdown(
                    value: selectedStatus?.displayName,
                    onChanged: (value) {
                      if (value == null) {
                        onStatusChanged(null);
                      } else {
                        onStatusChanged(
                          TaskStatus.values.firstWhere(
                            (status) => status.displayName == value,
                          ),
                        );
                      }
                    },
                    items: TaskStatus.values
                        .map((status) => status.displayName)
                        .toList(),
                    placeholder: 'All Status',
                  ),
                ),
                SizedBox(width: 8.w),

                // Priority Filter
                Expanded(
                  child: TaskFilterDropdown(
                    value: selectedPriority?.displayName,
                    onChanged: (value) {
                      if (value == null) {
                        onPriorityChanged(null);
                      } else {
                        onPriorityChanged(
                          TaskPriority.values.firstWhere(
                            (priority) => priority.displayName == value,
                          ),
                        );
                      }
                    },
                    items: TaskPriority.values
                        .map((priority) => priority.displayName)
                        .toList(),
                    placeholder: 'All Priority',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
