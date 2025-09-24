import 'package:go_router/go_router.dart';
import 'package:takharrujy/features/auth/presentation/screens/register_screen.dart';
import 'package:takharrujy/features/auth/presentation/screens/signin_screen.dart';
import 'package:takharrujy/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:takharrujy/features/tasks/presentation/screens/tasks_screen.dart';
import 'package:takharrujy/features/tasks/presentation/screens/submit_task_screen.dart';
import 'package:takharrujy/features/tasks/presentation/screens/create_task_screen.dart';
import 'package:takharrujy/features/tasks/data/models/task_model.dart';
import 'package:takharrujy/features/projects/presentation/screens/create_project_screen.dart';
import 'package:takharrujy/features/projects/presentation/screens/project_overview_screen.dart';
import 'package:takharrujy/features/settings/presentation/screens/settings_screen.dart';
import 'package:takharrujy/features/profile/presentation/screens/profile_screen.dart';
import 'package:takharrujy/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:takharrujy/features/messages/presentation/screens/messages_screen.dart';
import 'package:takharrujy/features/ai_assistant/presentation/screens/ai_assistant_screen.dart';
import 'package:takharrujy/features/community/presentation/screens/community_screen.dart';
import 'package:takharrujy/core/widgets/placeholder_screen.dart';

class AppRouter {
  // Auth Routes
  static const String signInRoute = '/signin';
  static const String registerRoute = '/register';

  // Main App Routes
  static const String dashboardRoute = '/dashboard';
  static const String createProjectRoute = '/create-project';
  static const String projectOverviewRoute = '/project-overview';
  static const String tasksRoute = '/tasks';
  static const String submitTaskRoute = '/submit-task';
  static const String createTaskRoute = '/create-task';
  static const String editTaskRoute = '/edit-task';
  static const String deliverablesRoute = '/deliverables';
  static const String aiAssistantRoute = '/ai-assistant';
  static const String communityRoute = '/community';
  static const String messagesRoute = '/messages';
  static const String notificationsRoute = '/notifications';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/profile';

  static final GoRouter _router = GoRouter(
    initialLocation: dashboardRoute,
    routes: [
      // Auth Routes
      GoRoute(
        path: signInRoute,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterScreen(),
      ),

      // Main App Routes
      GoRoute(
        path: dashboardRoute,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: createProjectRoute,
        builder: (context, state) => const CreateProjectScreen(),
      ),
      GoRoute(
        path: projectOverviewRoute,
        builder: (context, state) {
          final projectId = state.uri.queryParameters['projectId'] ?? '1';
          return ProjectOverviewScreen(projectId: projectId);
        },
      ),
      GoRoute(
        path: tasksRoute,
        builder: (context, state) => const TasksScreen(),
      ),
      GoRoute(
        path: submitTaskRoute,
        builder: (context, state) {
          final taskId = state.uri.queryParameters['taskId'];
          // TODO: Get task from repository based on taskId
          // For now, using a sample task
          final sampleTask = TaskModel(
            id: taskId ?? '1',
            title: 'Literature Review',
            description:
                'Complete comprehensive literature review for the project proposal including 15+ academic sources.',
            status: TaskStatus.inProgress,
            priority: TaskPriority.high,
            dueDate: DateTime(2025, 1, 25),
            assignedBy: 'Dr. Smith',
            createdAt: DateTime.now().subtract(const Duration(days: 5)),
            updatedAt: DateTime.now().subtract(const Duration(days: 1)),
          );
          return SubmitTaskScreen(task: sampleTask);
        },
      ),
      GoRoute(
        path: createTaskRoute,
        builder: (context, state) => const CreateTaskScreen(),
      ),
      GoRoute(
        path: editTaskRoute,
        builder: (context, state) {
          final taskId = state.uri.queryParameters['taskId'] ?? '1';
          // TODO: Get task from repository based on taskId
          // For now, using a sample task
          final sampleTask = TaskModel(
            id: taskId,
            title: 'Literature Review',
            description:
                'Complete comprehensive literature review for the project proposal including 15+ academic sources.',
            status: TaskStatus.inProgress,
            priority: TaskPriority.high,
            dueDate: DateTime(2025, 1, 25),
            assignedBy: 'Dr. Smith',
            createdAt: DateTime.now().subtract(const Duration(days: 5)),
            updatedAt: DateTime.now().subtract(const Duration(days: 1)),
          );
          return CreateTaskScreen(task: sampleTask);
        },
      ),
      GoRoute(
        path: deliverablesRoute,
        builder: (context, state) => const PlaceholderScreen(
          title: 'Deliverables',
          iconPath: 'assets/images/deliverable.svg',
          description: 'Manage project deliverables and submissions.',
          route: '/deliverables',
        ),
      ),
      GoRoute(
        path: aiAssistantRoute,
        builder: (context, state) => const AiAssistantScreen(),
      ),
      GoRoute(
        path: communityRoute,
        builder: (context, state) => const CommunityScreen(),
      ),
      GoRoute(
        path: settingsRoute,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: profileRoute,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: notificationsRoute,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: messagesRoute,
        builder: (context, state) => const MessagesScreen(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
