import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../features/tasks/data/models/task_model.dart';

class RecentTasksWidget extends StatefulWidget {
  final List<TaskModel> tasks;

  const RecentTasksWidget({super.key, required this.tasks});

  @override
  State<RecentTasksWidget> createState() => _RecentTasksWidgetState();
}

class _RecentTasksWidgetState extends State<RecentTasksWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Tab Bar
          Container(
            height: 47.h,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              indicatorWeight: 2,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              labelStyle: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Tasks'),
                Tab(text: 'Activity'),
                Tab(text: 'Files'),
              ],
            ),
          ),

          // Tab Content
          SizedBox(
            height: 442.h,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTasksTab(),
                _buildActivityTab(),
                _buildFilesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksTab() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Tasks',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                width: 28.25.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/new_task.svg',
                    width: 12.25.w,
                    height: 14.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Tasks List
          Expanded(
            child: ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                final task = widget.tasks[index];
                return _buildTaskCard(task);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(TaskModel task) {
    return Container(
      width: 324.w,
      height: 110.h,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              _buildStatusChip(task.status),
            ],
          ),
          SizedBox(height: 8.h),

          // Description
          Text(
            task.description,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),

          // Footer with assignee and due date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Assignee
              Row(
                children: [
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: const Color(0xFF0369A1),
                    child: SvgPicture.asset(
                      'assets/images/person.svg',
                      width: 12.w,
                      height: 12.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    task.assignedBy,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              // Due date and priority
              Row(
                children: [
                  Text(
                    _formatDate(task.dueDate ?? DateTime.now()),
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  _buildPriorityChip(task.priority),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus status) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (status) {
      case TaskStatus.toDo:
        backgroundColor = const Color(0xFFF3F4F6);
        textColor = AppColors.textSecondary;
        text = 'Pending';
        break;
      case TaskStatus.inProgress:
        backgroundColor = const Color(0xFFFEF3C7);
        textColor = AppColors.black;
        text = 'In Progress';
        break;
      case TaskStatus.completed:
        backgroundColor = const Color(0xFFDCFCE7);
        textColor = AppColors.black;
        text = 'Completed';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildPriorityChip(TaskPriority priority) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (priority) {
      case TaskPriority.low:
        backgroundColor = const Color(0xFFDCFCE7);
        textColor = const Color(0xFF15803D);
        text = 'Low';
        break;
      case TaskPriority.medium:
        backgroundColor = const Color(0xFFDBEAFE);
        textColor = const Color(0xFF1D4ED8);
        text = 'Medium';
        break;
      case TaskPriority.high:
        backgroundColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFB91C1C);
        text = 'High';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999.r),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildActivityTab() {
    return Center(
      child: Text(
        'Activity Tab',
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: 16.sp,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildFilesTab() {
    return Center(
      child: Text(
        'Files Tab',
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: 16.sp,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }
}
