import '../models/notification_item_model.dart';

class NotificationParsers {
  static NotificationType parseNotificationType(String type) {
    switch (type) {
      case 'deadline':
        return NotificationType.deadline;
      case 'approval':
        return NotificationType.approval;
      case 'message':
        return NotificationType.message;
      case 'task':
        return NotificationType.task;
      case 'announcement':
        return NotificationType.announcement;
      default:
        return NotificationType.announcement;
    }
  }

  static NotificationPriority parseNotificationPriority(String priority) {
    switch (priority) {
      case 'high':
        return NotificationPriority.high;
      case 'medium':
        return NotificationPriority.medium;
      case 'low':
        return NotificationPriority.low;
      default:
        return NotificationPriority.medium;
    }
  }
}
