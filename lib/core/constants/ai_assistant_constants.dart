/// AI Assistant feature constants
/// This file contains all constants specific to the AI Assistant feature
class AiAssistantConstants {
  // ============================================================================
  // FORM FIELD LABELS
  // ============================================================================

  static const String selectTaskLabel = 'Select Task';
  static const String typeOfAssistanceLabel = 'Type of Assistance';
  static const String yourQuestionLabel = 'Your Question';
  static const String attachFilesLabel = 'Attach Files (Optional)';

  // ============================================================================
  // PLACEHOLDER TEXTS
  // ============================================================================

  static const String chooseTaskPlaceholder = 'Choose a task...';
  static const String selectHelpTypePlaceholder = 'Select help type...';
  static const String questionHintText =
      'Describe your question or challenge in detail...';
  static const String uploadHintText = 'Tap to upload files';
  static const String uploadSubtext = 'PDF, DOC, images (max 10MB)';
  static const String beSpecificText = 'Be specific for better assistance';

  // ============================================================================
  // BUTTON TEXTS
  // ============================================================================

  static const String clearButtonText = 'Clear';
  static const String getHelpButtonText = 'Get Help';
  static const String helpfulButtonText = 'Helpful';
  static const String copyButtonText = 'Copy';
  static const String shareButtonText = 'Share';

  // ============================================================================
  // SECTION TITLES
  // ============================================================================

  static const String currentTaskTitle = 'Current Task';
  static const String askAiAssistantTitle = 'Ask AI Assistant';
  static const String aiResponseTitle = 'AI Response';
  static const String taskDetailsTitle = 'Task Details';

  // ============================================================================
  // ASSISTANCE TYPES
  // ============================================================================

  static const List<String> assistanceTypes = [
    'Select help type...',
    'Code Review',
    'Architecture Design',
    'Database Design',
    'Bug Fixing',
    'Documentation',
    'Best Practices',
  ];

  // ============================================================================
  // AI RESPONSE CONTENT
  // ============================================================================

  static const String aiResponseTitleText = 'Database design recommendations:';
  static const String responseStepsTitle = '🎯 Key Steps:';
  static const String schemaQuestionsText =
      'Need help with specific schema questions?';

  // ============================================================================
  // RESPONSE STEPS
  // ============================================================================

  static const List<String> responseSteps = [
    'Start with entity-relationship modeling',
    'Define primary and foreign keys',
    'Apply normalization principles',
    'Plan data integrity constraints',
  ];

  // ============================================================================
  // MESSAGES
  // ============================================================================

  static const String processingMessage = 'Processing your request...';
  static const String fileUploadMessage = 'File upload feature coming soon';
  static const String schemaHelpMessage = 'Opening schema questions help';
  static const String feedbackMessage = 'Thank you for your feedback!';
  static const String copyMessage = 'Response copied to clipboard';
  static const String shareMessage = 'Sharing response...';
  static const String questionRequiredMessage = 'Please enter your question';

  // ============================================================================
  // COLORS
  // ============================================================================

  static const int primaryBlue = 0xFF0284C7;
  static const int secondaryBlue = 0xFF0369A1;
  static const int lightBlue = 0xFF0EA5E9;
  static const int successGreen = 0xFF16A34A;
  static const int warningYellow = 0xFFF59E0B;
  static const int errorRed = 0xFFEF4444;
  static const int textGray = 0xFF6B7280;
  static const int borderGray = 0xFFD1D5DB;

  // ============================================================================
  // DIMENSIONS
  // ============================================================================

  static const double cardPadding = 17.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double iconSize = 24.0;
  static const double smallIconSize = 12.0;
  static const double progressPercentage = 0.65;
}
