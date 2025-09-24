import 'package:flutter/material.dart';

/// Abstract class containing all image paths used throughout the app
/// This centralizes image management and makes it easier to maintain
abstract class AppImages {
  static const String sara = 'assets/images/sara.png';

  // ==================== SVG Icons ====================

  // Navigation Icons
  static const String projectProgress = 'assets/images/project_progress.svg';
  static const String createNewTask = 'assets/images/create_new_task.svg';
  static const String taskList = 'assets/images/task_list.svg';
  static const String newMessage = 'assets/images/new_message.svg';
  static const String teamMember = 'assets/images/team_member.svg';

  // User/Avatar Icons
  static const String person = 'assets/images/person.svg';

  // Status Icons
  static const String active = 'assets/images/active.svg';
  static const String pendingTask = 'assets/images/pending_task.svg';
  static const String completedTask = 'assets/images/completed_task.svg';

  // Action Icons
  static const String date = 'assets/images/date.svg';
  static const String newTask = 'assets/images/new_task.svg';
  static const String filter = 'assets/images/filter.svg';
  static const String uploadDeliverable =
      'assets/images/upload_deliverable.svg';
  static const String aiResponse = 'assets/images/ai_response.svg';
  static const String updatePassword = 'assets/images/update_password.svg';
  static const IconData search = Icons.search;
  static const String ai = 'assets/images/ai_assistant.svg';

  // Notification Icons
  static const String projectDeadline = 'assets/images/project_deadline.svg';
  static const String systemAnnouncement =
      'assets/images/system_announcement.svg';
  static const String notification = 'assets/images/notification.svg';
  static const String changePhoto = 'assets/images/change_photo.svg';

  // ==================== Bottom Navigation Icons ====================

  /// Bottom navigation bar icons
  static const Map<String, String> bottomNavIcons = {
    'dashboard': projectProgress,
    'create': createNewTask,
    'tasks': taskList,
    'messages': newMessage,
    'community': teamMember,
  };

  // ==================== Common Avatar Images ====================

  /// Common avatar images used throughout the app
  static const Map<String, String> avatars = {'person': person};

  // ==================== Status Icons ====================

  /// Status-related icons
  static const Map<String, String> statusIcons = {
    'active': active,
    'pendingTask': pendingTask,
    'completedTask': completedTask,
  };

  // ==================== Action Icons ====================

  /// Action-related icons
  static const Map<String, String> actionIcons = {
    'date': date,
    'newTask': newTask,
    'filter': filter,
    'uploadDeliverable': uploadDeliverable,
    'aiResponse': aiResponse,
  };

  // ==================== Helper Methods ====================

  /// Get bottom navigation icon by route
  static String getBottomNavIcon(String route) {
    switch (route) {
      case '/dashboard':
        return bottomNavIcons['dashboard']!;
      case '/create-project':
        return bottomNavIcons['create']!;
      case '/tasks':
        return bottomNavIcons['tasks']!;
      case '/messages':
        return bottomNavIcons['messages']!;
      case '/community':
        return bottomNavIcons['community']!;
      default:
        return bottomNavIcons['dashboard']!;
    }
  }

  /// Get avatar image by type
  static String getAvatarImage(String type) {
    return avatars[type] ?? avatars['default']!;
  }

  /// Get status icon by status
  static String getStatusIcon(String status) {
    return statusIcons[status] ?? statusIcons['active']!;
  }

  /// Get action icon by action
  static String getActionIcon(String action) {
    return actionIcons[action] ?? '';
  }
}
