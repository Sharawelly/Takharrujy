/// Community feature constants
/// This file contains all constants specific to the community feature
class CommunityConstants {
  // ============================================================================
  // SCREEN DIMENSIONS
  // ============================================================================

  static const double cardWidth = 358.0;
  static const double cardHeight = 253.5;
  static const double filterCardHeight = 335.0;
  static const double cardPadding = 17.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;

  // ============================================================================
  // FILTER OPTIONS
  // ============================================================================

  static const List<String> facultyOptions = [
    'All Faculties',
    'Computer Science',
    'Engineering',
    'Business',
    'Medicine',
    'Arts',
  ];

  static const List<String> departmentOptions = [
    'All Departments',
    'Computer Science',
    'Software Engineering',
    'Data Science',
    'Business Administration',
    'Marketing',
  ];

  static const List<String> statusOptions = [
    'All Teams',
    'Open',
    'Full',
    'Closed',
  ];

  static const List<String> sortOptions = [
    'Recent',
    'Alphabetical',
    'Due Date',
    'Members',
  ];

  // ============================================================================
  // LABELS
  // ============================================================================

  static const String communityProjectsTitle = 'Community Projects';
  static const String discoverAndJoinSubtitle = 'Discover and join teams.';
  static const String facultyLabel = 'Faculty';
  static const String departmentLabel = 'Department';
  static const String statusLabel = 'Status';
  static const String searchProjectsButton = 'Search Projects';
  static const String foundProjectsText = 'Found';
  static const String projectsText = 'projects';

  // ============================================================================
  // MESSAGES
  // ============================================================================

  static const String searchMessage = 'Searching projects with filters';
  static const String joinRequestMessage = 'Request to join';
  static const String viewDetailsMessage = 'Viewing details for';
  static const String teamCompleteMessage = 'Team Complete';

  // ============================================================================
  // COLORS
  // ============================================================================

  static const int primaryBlue = 0xFF0284C7;
  static const int secondaryBlue = 0xFF0369A1;
  static const int successGreen = 0xFF16A34A;
  static const int warningYellow = 0xFFF59E0B;
  static const int errorRed = 0xFFEF4444;
  static const int textGray = 0xFF6B7280;
  static const int borderGray = 0xFFD1D5DB;
  static const int backgroundGray = 0xFFF9FAFB;
}
