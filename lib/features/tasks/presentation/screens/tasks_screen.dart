import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/router/app_router.dart';
import '../widgets/task_statistics_section_widget.dart';
import '../widgets/task_search_filter.dart';
import '../widgets/task_list_section_widget.dart';
import '../widgets/task_data_provider.dart';
import '../../data/models/task_model.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TaskDataProvider _taskDataProvider = TaskDataProvider();
  String searchQuery = '';
  TaskStatus? selectedStatus;
  TaskPriority? selectedPriority;

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _taskDataProvider.getFilteredTasks(
      searchQuery: searchQuery,
      selectedStatus: selectedStatus,
      selectedPriority: selectedPriority,
    );
    final statistics = _taskDataProvider.calculateStatistics();

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'My Tasks',
        showNotifications: true,
        showAvatar: true,
        onNotificationPressed: () => context.push(AppRouter.notificationsRoute),
        onProfilePressed: () => context.push(AppRouter.profileRoute),
        onSettingsPressed: () => context.push(AppRouter.settingsRoute),
        avatarImage: AppImages.sara,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/tasks',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRouter.createTaskRoute),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Cards
            TaskStatisticsSectionWidget(
              statistics: statistics,
              onStatusFilter: (status) =>
                  setState(() => selectedStatus = status),
            ),
            SizedBox(height: 16.h),

            // Search and Filter
            TaskSearchFilter(
              searchQuery: searchQuery,
              selectedStatus: selectedStatus,
              selectedPriority: selectedPriority,
              onSearchChanged: (query) => setState(() => searchQuery = query),
              onStatusChanged: (status) =>
                  setState(() => selectedStatus = status),
              onPriorityChanged: (priority) =>
                  setState(() => selectedPriority = priority),
            ),
            SizedBox(height: 16.h),

            // Tasks List
            TaskListSectionWidget(
              tasks: filteredTasks,
              onTaskMenuTap: (task) {},
              onTaskTap: (task) {
                // Navigate to edit task screen
                context.push('${AppRouter.editTaskRoute}?taskId=${task.id}');
              },
              onTaskAction: _taskDataProvider.handleTaskAction,
            ),
          ],
        ),
      ),
    );
  }
}
