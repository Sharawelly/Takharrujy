/// Notifications feature constants
/// This file contains all constants specific to the notifications feature
class NotificationsConstants {
  // ============================================================================
  // SCREEN DIMENSIONS
  // ============================================================================

  static const double screenWidth = 390.0;
  static const double screenHeight = 1309.0;
  static const double containerWidth = 358.0;
  static const double headerHeight = 56.0;
  static const double filterControlsHeight = 162.0;
  static const double notificationsListHeight = 749.0;
  static const double loadMoreHeight = 78.0;
  static const double notificationCardHeight = 137.0;
  static const double iconSize = 40.0;
  static const double smallIconSize = 16.0;
  static const double tagHeight = 24.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double padding = 14.0;
  static const double smallPadding = 8.0;
  static const double spacing = 20.0;
  static const double smallSpacing = 12.0;
  static const double tinySpacing = 4.0;

  // ============================================================================
  // HEADER SECTION
  // ============================================================================

  static const String notificationsTitle = 'Notifications';
  static const String notificationsSubtitle =
      'Stay updated with project activities';

  // ============================================================================
  // FILTER CONTROLS
  // ============================================================================

  static const String filterButtonText = 'Filter';
  static const String markAllReadButtonText = 'Mark All Read';
  static const String loadMoreButtonText = 'Load More';
  static const String showingText = 'Showing 5 of 23 notifications';

  // ============================================================================
  // FILTER OPTIONS
  // ============================================================================

  static const List<String> filterOptions = [
    'All Notifications',
    'Unread Only',
    'High Priority',
    'Deadlines',
  ];

  static const List<String> timeRangeOptions = [
    'Last 7 days',
    'Last 30 days',
    'All time',
  ];

  // ============================================================================
  // SAMPLE NOTIFICATIONS DATA
  // ============================================================================

  static const List<Map<String, dynamic>> sampleNotifications = [
    {
      'id': '1',
      'title': 'Project Deadline Approaching',
      'description':
          'Your "AI-Based Learning System" deliverable is due in 3 days.',
      'timeAgo': '2h ago',
      'type': 'deadline',
      'priority': 'high',
      'isUnread': true,
      'tags': ['High Priority', 'Deadline'],
    },
    {
      'id': '2',
      'title': 'Deliverable Approved',
      'description':
          'Dr. Ahmed Hassan approved your project proposal with positive feedback.',
      'timeAgo': '5h ago',
      'type': 'approval',
      'priority': 'medium',
      'isUnread': false,
      'tags': ['Approved', 'Feedback'],
    },
    {
      'id': '3',
      'title': 'New Message from Supervisor',
      'description':
          'Dr. Sarah Mohamed sent a message about your progress report.',
      'timeAgo': '1d ago',
      'type': 'message',
      'priority': 'medium',
      'isUnread': true,
      'tags': ['Message'],
    },
    {
      'id': '4',
      'title': 'Team Member Added Task',
      'description':
          'Ahmed Ali added "Database Design" task with medium priority.',
      'timeAgo': '2d ago',
      'type': 'task',
      'priority': 'medium',
      'isUnread': false,
      'tags': ['Task', 'Team Update'],
    },
    {
      'id': '5',
      'title': 'System Announcement',
      'description':
          'New AI Assistant features are now available for all students.',
      'timeAgo': '3d ago',
      'type': 'announcement',
      'priority': 'low',
      'isUnread': false,
      'tags': ['Announcement'],
    },
  ];

  // ============================================================================
  // COLORS
  // ============================================================================

  static const int primaryBlue = 0xFF0EA5E9;
  static const int secondaryBlue = 0xFF0284C7;
  static const int backgroundGray = 0xFFF8FAFC;
  static const int white = 0xFFFFFFFF;
  static const int borderGray = 0xFFCED4DA;
  static const int lightBorderGray = 0xFFE2E8F0;
  static const int filterBorderGray = 0xFFCBD5E1;
  static const int textDark = 0xFF0F172A;
  static const int textGray = 0xFF475569;
  static const int textMediumGray = 0xFF334155;
  static const int textLightGray = 0xFF64748B;
  static const int successGreen = 0xFF16A34A;
  static const int errorRed = 0xFFEF4444;
  static const int warningOrange = 0xFFD97706;
  static const int deadlineRed = 0xFFDC2626;
  static const int approvalGreen = 0xFF16A34A;
  static const int messageBlue = 0xFF0284C7;
  static const int taskOrange = 0xFFD97706;
  static const int announcementGray = 0xFF475569;

  // ============================================================================
  // NOTIFICATION TYPES
  // ============================================================================

  static const String deadlineType = 'deadline';
  static const String approvalType = 'approval';
  static const String messageType = 'message';
  static const String taskType = 'task';
  static const String announcementType = 'announcement';

  // ============================================================================
  // NOTIFICATION PRIORITIES
  // ============================================================================

  static const String highPriority = 'high';
  static const String mediumPriority = 'medium';
  static const String lowPriority = 'low';

  // ============================================================================
  // TAGS
  // ============================================================================

  static const String highPriorityTag = 'High Priority';
  static const String deadlineTag = 'Deadline';
  static const String approvedTag = 'Approved';
  static const String feedbackTag = 'Feedback';
  static const String messageTag = 'Message';
  static const String taskTag = 'Task';
  static const String teamUpdateTag = 'Team Update';
  static const String announcementTag = 'Announcement';

  // ============================================================================
  // ICON PATHS
  // ============================================================================

  static const String filterIcon = 'assets/images/filter.svg';
  static const String completedTaskIcon = 'assets/images/completed_task.svg';
  static const String projectDeadlineIcon =
      'assets/images/project_deadline.svg';
  static const String newMessageIcon = 'assets/images/new_message.svg';
  static const String teamMemberIcon = 'assets/images/team_member.svg';
  static const String systemAnnouncementIcon =
      'assets/images/system_announcement.svg';

  // ============================================================================
  // MESSAGES
  // ============================================================================

  static const String filterOptionsMessage =
      'Filter options will be implemented';
  static const String markAllReadMessage = 'All notifications marked as read';
  static const String loadMoreMessage = 'Loading more notifications...';
  static const String notificationSelectedMessage = 'Notification selected';

  // ============================================================================
  // TEXT STYLES
  // ============================================================================

  static const double titleFontSize = 24.0;
  static const double titleLineHeight = 1.33;
  static const double subtitleFontSize = 14.0;
  static const double subtitleLineHeight = 1.43;
  static const double buttonFontSize = 14.0;
  static const double buttonLineHeight = 1.21;
  static const double cardTitleFontSize = 14.0;
  static const double cardTitleLineHeight = 1.29;
  static const double cardDescriptionFontSize = 14.0;
  static const double cardDescriptionLineHeight = 1.64;
  static const double timeFontSize = 12.0;
  static const double timeLineHeight = 1.33;
  static const double tagFontSize = 12.0;
  static const double tagLineHeight = 1.25;
  static const double showingFontSize = 14.0;
  static const double showingLineHeight = 1.43;
}
