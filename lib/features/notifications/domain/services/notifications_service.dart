import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/notification_item_model.dart';
import 'package:takharrujy/core/constants/constants.dart';

class NotificationsService {
  /// Get sample notifications data
  List<NotificationItemModel> getSampleNotifications() {
    return NotificationsConstants.sampleNotifications
        .map((data) => NotificationItemModel.fromMap(data))
        .toList();
  }

  /// Filter notifications by type
  List<NotificationItemModel> filterByType(
    List<NotificationItemModel> notifications,
    String filter,
  ) {
    if (filter == 'All Notifications') return notifications;

    return notifications.where((notification) {
      switch (filter) {
        case 'Unread Only':
          return notification.isUnread;
        case 'High Priority':
          return notification.priority == NotificationPriority.high;
        case 'Deadlines':
          return notification.type == NotificationType.deadline;
        default:
          return true;
      }
    }).toList();
  }

  /// Filter notifications by time range
  List<NotificationItemModel> filterByTimeRange(
    List<NotificationItemModel> notifications,
    String timeRange,
  ) {
    // For now, return all notifications
    // In a real app, you would filter based on actual timestamps
    return notifications;
  }

  /// Mark notification as read
  NotificationItemModel markAsRead(NotificationItemModel notification) {
    return notification.copyWith(isUnread: false);
  }

  /// Mark notification as unread
  NotificationItemModel markAsUnread(NotificationItemModel notification) {
    return notification.copyWith(isUnread: true);
  }

  /// Mark all notifications as read
  List<NotificationItemModel> markAllAsRead(
    List<NotificationItemModel> notifications,
  ) {
    return notifications
        .map((notification) => markAsRead(notification))
        .toList();
  }

  /// Get notification by ID
  NotificationItemModel? getNotificationById(
    List<NotificationItemModel> notifications,
    String id,
  ) {
    try {
      return notifications.firstWhere((notification) => notification.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get unread count
  int getUnreadCount(List<NotificationItemModel> notifications) {
    return notifications.where((notification) => notification.isUnread).length;
  }

  /// Get notifications by priority
  List<NotificationItemModel> getNotificationsByPriority(
    List<NotificationItemModel> notifications,
    NotificationPriority priority,
  ) {
    return notifications.where((notification) {
      return notification.priority == priority;
    }).toList();
  }

  /// Get notifications by type
  List<NotificationItemModel> getNotificationsByType(
    List<NotificationItemModel> notifications,
    NotificationType type,
  ) {
    return notifications.where((notification) {
      return notification.type == type;
    }).toList();
  }

  /// Show success message
  void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
      ),
    );
  }

  /// Show info message
  void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  /// Show error message
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }
}
