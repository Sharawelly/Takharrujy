class MessageModel {
  final String id;
  final String content;
  final String senderId;
  final String senderName;
  final String senderAvatar;
  final DateTime timestamp;
  final bool isFromCurrentUser;
  final MessageType type;

  const MessageModel({
    required this.id,
    required this.content,
    required this.senderId,
    required this.senderName,
    required this.senderAvatar,
    required this.timestamp,
    required this.isFromCurrentUser,
    this.type = MessageType.text,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      content: map['content'] as String,
      senderId: map['senderId'] as String,
      senderName: map['senderName'] as String,
      senderAvatar: map['senderAvatar'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
      isFromCurrentUser: map['isFromCurrentUser'] as bool,
      type: MessageType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => MessageType.text,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'senderId': senderId,
      'senderName': senderName,
      'senderAvatar': senderAvatar,
      'timestamp': timestamp.toIso8601String(),
      'isFromCurrentUser': isFromCurrentUser,
      'type': type.name,
    };
  }

  MessageModel copyWith({
    String? id,
    String? content,
    String? senderId,
    String? senderName,
    String? senderAvatar,
    DateTime? timestamp,
    bool? isFromCurrentUser,
    MessageType? type,
  }) {
    return MessageModel(
      id: id ?? this.id,
      content: content ?? this.content,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      timestamp: timestamp ?? this.timestamp,
      isFromCurrentUser: isFromCurrentUser ?? this.isFromCurrentUser,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageModel &&
        other.id == id &&
        other.content == content &&
        other.senderId == senderId &&
        other.senderName == senderName &&
        other.senderAvatar == senderAvatar &&
        other.timestamp == timestamp &&
        other.isFromCurrentUser == isFromCurrentUser &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        senderId.hashCode ^
        senderName.hashCode ^
        senderAvatar.hashCode ^
        timestamp.hashCode ^
        isFromCurrentUser.hashCode ^
        type.hashCode;
  }

  @override
  String toString() {
    return 'MessageModel(id: $id, content: $content, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, isFromCurrentUser: $isFromCurrentUser, type: $type)';
  }
}

enum MessageType { text, image, file, audio, video }
