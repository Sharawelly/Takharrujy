/// Dashboard feature constants
/// This file contains all constants specific to the dashboard feature
class DashboardConstants {
  // ============================================================================
  // SCREEN DIMENSIONS
  // ============================================================================

  /// Card dimensions
  static const double cardWidth = 358.0;
  static const double statCardWidth = 171.0;
  static const double statCardHeight = 86.0;
  static const double quickActionCardHeight = 74.0;
  static const double currentProjectCardHeight = 294.0;
  static const double recentActivityCardHeight = 370;
  static const double activityItemHeight = 60.0;
  static const double cardPadding = 12.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;

  // ============================================================================
  // WELCOME SECTION
  // ============================================================================

  static const String welcomeTitle = 'Welcome back, John!';
  static const String welcomeSubtitle = 'Here\'s your project overview';

  // ============================================================================
  // STATS LABELS
  // ============================================================================

  static const String activeProjectLabel = 'Active Project';
  static const String pendingTasksLabel = 'Pending Tasks';
  static const String deadlinesLabel = 'Deadlines';
  static const String notificationsLabel = 'Notifications';

  // ============================================================================
  // STATS VALUES
  // ============================================================================

  static const String activeProjectValue = '1';
  static const String pendingTasksValue = '8';
  static const String deadlinesValue = '3';
  static const String notificationsValue = '5';

  // ============================================================================
  // CURRENT PROJECT
  // ============================================================================

  static const String currentProjectTitle = 'Current Project';
  static const String viewDetailsButton = 'View Details';
  static const String projectTitle = 'AI-Powered Learning Platform';
  static const String projectDescription =
      'A comprehensive platform using AI to\npersonalize learning experiences.';
  static const String statusLabel = 'Status:';
  static const String statusValue = 'In Progress';
  static const String supervisorLabel = 'Supervisor:';
  static const String supervisorValue = 'Dr. Sarah Johnson';
  static const String deadlineLabel = 'Deadline:';
  static const String deadlineValue = 'May 15, 2025';
  static const String progressLabel = 'Overall Progress';
  static const String progressValue = '65%';

  // ============================================================================
  // QUICK ACTIONS
  // ============================================================================

  static const String quickActionsTitle = 'Quick Actions';
  static const String createTaskTitle = 'Create New Task';
  static const String createTaskSubtitle = 'Add a new task to your project';
  static const String uploadDeliverableTitle = 'Upload Deliverable';
  static const String uploadDeliverableSubtitle = 'Submit your latest work';
  static const String aiAssistantTitle = 'AI Assistant';
  static const String aiAssistantSubtitle = 'Get help with your project';

  // ============================================================================
  // RECENT ACTIVITY
  // ============================================================================

  static const String recentActivityTitle = 'Recent Activity';
  static const String taskCompletedTitle = 'Task "Database Design" completed';
  static const String taskCompletedTime = '2 hours ago';
  static const String messageReceivedTitle =
      'New message from Dr. Sarah Johnson';
  static const String messageReceivedTime = '5 hours ago';
  static const String deliverableSubmittedTitle =
      'Deliverable "Research Report" submitted';
  static const String deliverableSubmittedTime = '1 day ago';

  // ============================================================================
  // COLORS
  // ============================================================================

  static const int primaryBlue = 0xFF0284C7;
  static const int secondaryBlue = 0xFF0369A1;
  static const int successGreen = 0xFF16A34A;
  static const int warningOrange = 0xFFEA580C;
  static const int errorRed = 0xFFDC2626;
  static const int purple = 0xFF9333EA;
  static const int indigo = 0xFF4F46E5;
  static const int textGray = 0xFF4B5563;
  static const int textDark = 0xFF1F2937;
  static const int backgroundGray = 0xFFF9FAFB;
  static const int borderGray = 0xFFF3F4F6;
  static const int lightBlue = 0xFFDBEAFE;
  static const int lightOrange = 0xFFFFEDD5;
  static const int lightRed = 0xFFFEE2E2;
  static const int lightGreen = 0xFFDCFCE7;
  static const int lightPurple = 0xFFF3E8FF;
  static const int lightIndigo = 0xFFE0E7FF;
  static const int lightSuccess = 0xFFF0FDF4;
  static const int lightInfo = 0xFFEFF6FF;
  static const int lightPurpleBg = 0xFFFAF5FF;

  // ============================================================================
  // ICON DATA
  // ============================================================================

  static const String workIcon = 'Icons.work_outline';
  static const String pendingIcon = 'Icons.pending_actions';
  static const String scheduleIcon = 'Icons.schedule';
  static const String notificationIcon = 'Icons.notifications_outlined';
  static const String addIcon = 'Icons.add_circle_outline';
  static const String uploadIcon = 'Icons.upload_file';
  static const String aiIcon = 'Icons.smart_toy_outlined';
  static const String checkIcon = 'Icons.check_circle_outline';
  static const String messageIcon = 'Icons.message_outlined';
  static const String descriptionIcon = 'Icons.description_outlined';
}
