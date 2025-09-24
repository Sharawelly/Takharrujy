import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
// import '../../../../core/widgets/navigation_drawer.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/project_statistics_widget.dart';
import '../widgets/team_supervisor_widget.dart';
import '../widgets/recent_tasks_widget.dart';
import '../widgets/recent_activity_widget.dart';
import '../widgets/project_breadcrumb_widget.dart';
import '../widgets/project_details_card_widget.dart';
import '../widgets/project_sample_data_widget.dart';

class ProjectOverviewScreen extends StatelessWidget {
  final String projectId;

  const ProjectOverviewScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    // Sample data - in real app, this would come from a repository
    final project = ProjectSampleDataWidget.getSampleProject();
    final teamMembers = ProjectSampleDataWidget.getSampleTeamMembers();
    final tasks = ProjectSampleDataWidget.getSampleTasks();
    final activities = ProjectSampleDataWidget.getSampleActivities();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Project Overview',
        showNotifications: true,
        showAvatar: true,
        avatarImage: AppImages.person,
      ),
      // drawer: CustomNavigationDrawer(
      //   currentRoute: '/project-overview',
      //   onClose: () => scaffoldKey.currentState?.closeDrawer(),
      // ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/project-overview',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            const ProjectBreadcrumbWidget(),
            SizedBox(height: 20.h),

            // Project Details Card
            ProjectDetailsCardWidget(project: project),
            SizedBox(height: 20.h),

            // Statistics
            ProjectStatisticsWidget(
              totalTasks: 24,
              completedTasks: 16,
              inProgressTasks: 5,
              deliverables: 8,
            ),
            SizedBox(height: 20.h),

            // Team & Supervisor
            TeamSupervisorWidget(
              supervisorName: project.supervisorName,
              supervisorDepartment: project.supervisorDepartment,
              teamMembers: teamMembers,
            ),
            SizedBox(height: 20.h),

            // Recent Tasks
            RecentTasksWidget(tasks: tasks),
            SizedBox(height: 20.h),

            // Recent Activity
            RecentActivityWidget(activities: activities),
          ],
        ),
      ),
    );
  }
}
