import '../utils/notification_parsers.dart';

enum NotificationType { deadline, approval, message, task, announcement }

enum NotificationPriority { high, medium, low }

class NotificationItemModel {
  final String id;
  final String title;
  final String description;
  final String timeAgo;
  final NotificationType type;
  final NotificationPriority priority;
  final bool isUnread;
  final List<String> tags;

  const NotificationItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.type,
    required this.priority,
    required this.isUnread,
    required this.tags,
  });

  factory NotificationItemModel.fromMap(Map<String, dynamic> map) {
    return NotificationItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      timeAgo: map['timeAgo'] as String,
      type: NotificationParsers.parseNotificationType(map['type'] as String),
      priority: NotificationParsers.parseNotificationPriority(
        map['priority'] as String,
      ),
      isUnread: map['isUnread'] as bool,
      tags: List<String>.from(map['tags'] as List),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'timeAgo': timeAgo,
      'type': type.name,
      'priority': priority.name,
      'isUnread': isUnread,
      'tags': tags,
    };
  }

  NotificationItemModel copyWith({
    String? id,
    String? title,
    String? description,
    String? timeAgo,
    NotificationType? type,
    NotificationPriority? priority,
    bool? isUnread,
    List<String>? tags,
  }) {
    return NotificationItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timeAgo: timeAgo ?? this.timeAgo,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      isUnread: isUnread ?? this.isUnread,
      tags: tags ?? this.tags,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationItemModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.timeAgo == timeAgo &&
        other.type == type &&
        other.priority == priority &&
        other.isUnread == isUnread &&
        other.tags == tags;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        timeAgo.hashCode ^
        type.hashCode ^
        priority.hashCode ^
        isUnread.hashCode ^
        tags.hashCode;
  }

  @override
  String toString() {
    return 'NotificationItemModel('
        'id: $id, '
        'title: $title, '
        'description: $description, '
        'timeAgo: $timeAgo, '
        'type: $type, '
        'priority: $priority, '
        'isUnread: $isUnread, '
        'tags: $tags)';
  }
}
