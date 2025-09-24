import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/task_statistics_card.dart';
import '../../data/models/task_model.dart';

class TaskStatisticsSectionWidget extends StatelessWidget {
  final Map<String, int> statistics;
  final Function(TaskStatus?) onStatusFilter;

  const TaskStatisticsSectionWidget({
    super.key,
    required this.statistics,
    required this.onStatusFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260.h,
      child: Column(
        children: [
          // First Row
          Row(
            children: [
              Expanded(
                child: TaskStatisticsCard(
                  title: 'Total Tasks',
                  count: statistics['total']!,
                  iconPath: AppImages.taskList,
                  iconColor: AppColors.grey600,
                  backgroundColor: AppColors.grey100,
                  onTap: () {
                    // TODO: Handle total tasks tap
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TaskStatisticsCard(
                  title: 'To Do',
                  count: statistics['toDo']!,
                  iconPath: AppImages.pendingTask,
                  iconColor: AppColors.warningDark,
                  backgroundColor: AppColors.warningLight,
                  onTap: () {
                    onStatusFilter(TaskStatus.toDo);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Second Row
          Row(
            children: [
              Expanded(
                child: TaskStatisticsCard(
                  title: 'In Progress',
                  count: statistics['inProgress']!,
                  iconPath: AppImages.active,
                  iconColor: AppColors.primary,
                  backgroundColor: AppColors.primaryLight,
                  onTap: () {
                    onStatusFilter(TaskStatus.inProgress);
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TaskStatisticsCard(
                  title: 'Completed',
                  count: statistics['completed']!,
                  iconPath: AppImages.completedTask,
                  iconColor: AppColors.successDark,
                  backgroundColor: AppColors.successLight,
                  onTap: () {
                    onStatusFilter(TaskStatus.completed);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
