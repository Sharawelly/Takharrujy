/// Main application constants
/// This file contains global constants used across the entire app
class AppConstants {
  // ============================================================================
  // APP INFORMATION
  // ============================================================================

  /// Application name
  static const String appName = 'Takharrujy';

  /// Application version
  static const String appVersion = '1.0.0';

  /// Application description
  static const String appDescription = 'Project Management System';

  // ============================================================================
  // ROUTES
  // ============================================================================

  /// Authentication routes
  static const String signInRoute = '/signin';
  static const String registerRoute = '/register';

  /// Main app routes
  static const String dashboardRoute = '/dashboard';
  static const String createProjectRoute = '/create-project';
  static const String projectOverviewRoute = '/project-overview';
  static const String tasksRoute = '/tasks';
  static const String submitTaskRoute = '/submit-task';
  static const String createTaskRoute = '/create-task';
  static const String deliverablesRoute = '/deliverables';
  static const String aiAssistantRoute = '/ai-assistant';
  static const String communityRoute = '/community';
  static const String messagesRoute = '/messages';
  static const String notificationsRoute = '/notifications';
  static const String settingsRoute = '/settings';
  static const String profileRoute = '/profile';

  // ============================================================================
  // COMMON DIMENSIONS
  // ============================================================================

  /// Common padding values
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  /// Common spacing values
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 32.0;

  /// Common border radius values
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  /// Common icon sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;

  // ============================================================================
  // COMMON STRINGS
  // ============================================================================

  /// Common button texts
  static const String saveButton = 'Save';
  static const String cancelButton = 'Cancel';
  static const String deleteButton = 'Delete';
  static const String editButton = 'Edit';
  static const String addButton = 'Add';
  static const String createButton = 'Create';
  static const String updateButton = 'Update';
  static const String submitButton = 'Submit';
  static const String closeButton = 'Close';
  static const String backButton = 'Back';
  static const String nextButton = 'Next';
  static const String previousButton = 'Previous';
  static const String doneButton = 'Done';
  static const String continueButton = 'Continue';
  static const String confirmButton = 'Confirm';
  static const String retryButton = 'Retry';
  static const String refreshButton = 'Refresh';
  static const String loadMoreButton = 'Load More';
  static const String viewAllButton = 'View All';
  static const String viewDetailsButton = 'View Details';

  /// Common status texts
  static const String loadingText = 'Loading...';
  static const String errorText = 'Error';
  static const String successText = 'Success';
  static const String warningText = 'Warning';
  static const String infoText = 'Info';
  static const String noDataText = 'No data available';
  static const String tryAgainText = 'Try again';
  static const String somethingWentWrongText = 'Something went wrong';

  /// Common validation messages
  static const String requiredFieldText = 'This field is required';
  static const String invalidEmailText = 'Please enter a valid email';
  static const String invalidPasswordText =
      'Password must be at least 6 characters';
  static const String passwordMismatchText = 'Passwords do not match';
  static const String invalidPhoneText = 'Please enter a valid phone number';

  // ============================================================================
  // COMMON ASSETS
  // ============================================================================

  /// Common icon paths
  static const String personIcon = 'assets/images/person.svg';
  static const String notificationIcon = 'assets/images/notification.svg';
  static const String filterIcon = 'assets/images/filter.svg';
  static const String editIcon = 'assets/images/edit.svg';
  static const String deleteIcon = 'assets/images/delete.svg';
  static const String addIcon = 'assets/images/create_new_task.svg';
  static const String checkIcon = 'assets/images/completed_task.svg';
  static const String pendingIcon = 'assets/images/pending_task.svg';
  static const String dateIcon = 'assets/images/date.svg';
  static const String deadlineIcon = 'assets/images/deadline.svg';
  static const String deliverableIcon = 'assets/images/deliverable.svg';
  static const String taskListIcon = 'assets/images/task_list.svg';
  static const String projectProgressIcon =
      'assets/images/project_progress.svg';
  static const String aiAssistantIcon = 'assets/images/ai_assistant.svg';
  static const String teamMemberIcon = 'assets/images/team_member.svg';
  static const String newMessageIcon = 'assets/images/new_message.svg';
  static const String systemAnnouncementIcon =
      'assets/images/system_announcement.svg';
  static const String projectDeadlineIcon =
      'assets/images/project_deadline.svg';
  static const String updatePasswordIcon = 'assets/images/update_password.svg';
  static const String uploadDeliverableIcon =
      'assets/images/upload_deliverable.svg';
  static const String changePhotoIcon = 'assets/images/change_photo.svg';
  static const String facultyIcon = 'assets/images/faculty.svg';
  static const String aiResponseIcon = 'assets/images/ai_response.svg';
  static const String activeIcon = 'assets/images/active.svg';

  // ============================================================================
  // COMMON COLORS (using hex values for consistency)
  // ============================================================================

  /// Primary colors
  static const int primaryBlue = 0xFF0284C7;
  static const int primaryBlueDark = 0xFF0369A1;
  static const int primaryBlueLight = 0xFF0EA5E9;

  /// Status colors
  static const int successGreen = 0xFF16A34A;
  static const int warningOrange = 0xFFEA580C;
  static const int errorRed = 0xFFDC2626;
  static const int infoBlue = 0xFF2563EB;

  /// Neutral colors
  static const int textDark = 0xFF1F2937;
  static const int textGray = 0xFF6B7280;
  static const int textLightGray = 0xFF9CA3AF;
  static const int backgroundGray = 0xFFF9FAFB;
  static const int borderGray = 0xFFE5E7EB;
  static const int white = 0xFFFFFFFF;
  static const int black = 0xFF000000;

  // ============================================================================
  // COMMON DURATIONS
  // ============================================================================

  /// Animation durations
  static const Duration animationDurationShort = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 300);
  static const Duration animationDurationLong = Duration(milliseconds: 500);

  /// Debounce durations
  static const Duration debounceDuration = Duration(milliseconds: 300);

  // ============================================================================
  // COMMON LIMITS
  // ============================================================================

  /// Text input limits
  static const int maxNameLength = 50;
  static const int maxDescriptionLength = 500;
  static const int maxCommentLength = 200;
  static const int maxTitleLength = 100;

  /// File upload limits
  static const int maxFileSizeMB = 10;
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  static const List<String> allowedDocumentTypes = [
    'pdf',
    'doc',
    'docx',
    'txt',
  ];

  /// Pagination limits
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
}
