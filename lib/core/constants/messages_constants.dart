/// Messages feature constants
/// This file contains all constants specific to the messages feature
class MessagesConstants {
  // ============================================================================
  // SCREEN DIMENSIONS
  // ============================================================================

  static const double screenWidth = 390.0;
  static const double screenHeight = 800.0;
  static const double containerWidth = 384.0;
  static const double searchHeight = 75.0;
  static const double searchFieldHeight = 42.0;
  static const double conversationItemHeight = 96.0;
  static const double avatarSize = 48.0;
  static const double onlineIndicatorSize = 16.0;
  static const double conversationDetailsWidth = 288.0;
  static const double conversationDetailsHeight = 64.0;
  static const double padding = 16.0;
  static const double horizontalPadding = 20.0;
  static const double verticalPadding = 16.0;
  static const double borderRadius = 8.0;

  // ============================================================================
  // SEARCH SECTION
  // ============================================================================

  static const String searchHintText = 'Search conversations...';
  static const String filterIcon = 'assets/images/filter.svg';

  // ============================================================================
  // SAMPLE CONVERSATIONS DATA
  // ============================================================================

  static const List<Map<String, dynamic>> sampleConversations = [
    {
      'id': '1',
      'name': 'Dr. Ahmed Hassan',
      'lastMessage': 'Project feedback ready for review',
      'timeAgo': '2h',
      'role': 'Supervisor',
      'isUnread': true,
      'avatar': 'assets/images/person.svg',
      'hasOnlineIndicator': true,
    },
    {
      'id': '2',
      'name': 'Sarah Mohammed',
      'lastMessage': 'Task assignment completed',
      'timeAgo': '1d',
      'role': 'Team Member',
      'isUnread': false,
      'avatar': 'assets/images/person.svg',
      'hasOnlineIndicator': false,
    },
    {
      'id': '3',
      'name': 'Omar Ali',
      'lastMessage': 'Meeting scheduled for tomorrow',
      'timeAgo': '2d',
      'role': 'Team Member',
      'isUnread': false,
      'avatar': 'assets/images/person.svg',
      'hasOnlineIndicator': false,
    },
  ];

  // ============================================================================
  // COLORS
  // ============================================================================

  static const int primaryBlue = 0xFF2563EB;
  static const int backgroundGray = 0xFFF9FAFB;
  static const int white = 0xFFFFFFFF;
  static const int borderGray = 0xFFCED4DA;
  static const int lightBorderGray = 0xFFE5E7EB;
  static const int searchBorderGray = 0xFFD1D5DB;
  static const int unreadBackground = 0xFFF0F9FF;
  static const int textDark = 0xFF111827;
  static const int textGray = 0xFF6B7280;
  static const int textMediumGray = 0xFF4B5563;
  static const int searchHintGray = 0xFFADAEBC;
  static const int iconGray = 0xFF9CA3AF;
  static const int onlineBlue = 0xFF3B82F6;
  static const int gradientPink = 0xFFEC4899;
  static const int gradientBlue = 0xFF3B82F6;
  static const int gradientYellow = 0xFFF59E0B;

  // ============================================================================
  // ROLES
  // ============================================================================

  static const String supervisorRole = 'Supervisor';
  static const String teamMemberRole = 'Team Member';

  // ============================================================================
  // MESSAGES
  // ============================================================================

  static const String searchMessage = 'Searching conversations';
  static const String conversationSelectedMessage = 'Conversation selected';
  static const String noConversationsMessage = 'No conversations found';
  static const String errorMessage = 'Error loading conversations';

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  static const double filterIconSize = 16.0;
  static const double avatarIconSize = 24.0;
  static const double onlineIndicatorBorder = 2.0;

  // ============================================================================
  // TEXT STYLES
  // ============================================================================

  static const double searchHintFontSize = 16.0;
  static const double searchHintLineHeight = 1.5;
  static const double nameFontSize = 16.0;
  static const double nameLineHeight = 1.5;
  static const double timeFontSize = 12.0;
  static const double timeLineHeight = 1.33;
  static const double messageFontSize = 14.0;
  static const double messageLineHeight = 1.43;
  static const double roleFontSize = 12.0;
  static const double roleLineHeight = 1.33;
}
