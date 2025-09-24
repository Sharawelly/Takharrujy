class ConversationItemModel {
  final String id;
  final String name;
  final String lastMessage;
  final String timeAgo;
  final String role;
  final bool isUnread;
  final String avatar;
  final bool hasOnlineIndicator;

  const ConversationItemModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.timeAgo,
    required this.role,
    required this.isUnread,
    required this.avatar,
    required this.hasOnlineIndicator,
  });

  factory ConversationItemModel.fromMap(Map<String, dynamic> map) {
    return ConversationItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      lastMessage: map['lastMessage'] as String,
      timeAgo: map['timeAgo'] as String,
      role: map['role'] as String,
      isUnread: map['isUnread'] as bool,
      avatar: map['avatar'] as String,
      hasOnlineIndicator: map['hasOnlineIndicator'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastMessage': lastMessage,
      'timeAgo': timeAgo,
      'role': role,
      'isUnread': isUnread,
      'avatar': avatar,
      'hasOnlineIndicator': hasOnlineIndicator,
    };
  }

  ConversationItemModel copyWith({
    String? id,
    String? name,
    String? lastMessage,
    String? timeAgo,
    String? role,
    bool? isUnread,
    String? avatar,
    bool? hasOnlineIndicator,
  }) {
    return ConversationItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      timeAgo: timeAgo ?? this.timeAgo,
      role: role ?? this.role,
      isUnread: isUnread ?? this.isUnread,
      avatar: avatar ?? this.avatar,
      hasOnlineIndicator: hasOnlineIndicator ?? this.hasOnlineIndicator,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConversationItemModel &&
        other.id == id &&
        other.name == name &&
        other.lastMessage == lastMessage &&
        other.timeAgo == timeAgo &&
        other.role == role &&
        other.isUnread == isUnread &&
        other.avatar == avatar &&
        other.hasOnlineIndicator == hasOnlineIndicator;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        lastMessage.hashCode ^
        timeAgo.hashCode ^
        role.hashCode ^
        isUnread.hashCode ^
        avatar.hashCode ^
        hasOnlineIndicator.hashCode;
  }

  @override
  String toString() {
    return 'ConversationItemModel(id: $id, name: $name, lastMessage: $lastMessage, timeAgo: $timeAgo, role: $role, isUnread: $isUnread, avatar: $avatar, hasOnlineIndicator: $hasOnlineIndicator)';
  }
}
