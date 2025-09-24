import 'package:equatable/equatable.dart';

class AiResponseModel extends Equatable {
  final String title;
  final List<String> content;
  final DateTime timestamp;
  final bool isHelpful;
  final int helpfulCount;

  const AiResponseModel({
    required this.title,
    required this.content,
    required this.timestamp,
    this.isHelpful = false,
    this.helpfulCount = 0,
  });

  @override
  List<Object?> get props => [
    title,
    content,
    timestamp,
    isHelpful,
    helpfulCount,
  ];

  AiResponseModel copyWith({
    String? title,
    List<String>? content,
    DateTime? timestamp,
    bool? isHelpful,
    int? helpfulCount,
  }) {
    return AiResponseModel(
      title: title ?? this.title,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isHelpful: isHelpful ?? this.isHelpful,
      helpfulCount: helpfulCount ?? this.helpfulCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isHelpful': isHelpful,
      'helpfulCount': helpfulCount,
    };
  }

  factory AiResponseModel.fromJson(Map<String, dynamic> json) {
    return AiResponseModel(
      title: json['title'] as String,
      content: List<String>.from(json['content']),
      timestamp: DateTime.parse(json['timestamp']),
      isHelpful: json['isHelpful'] as bool? ?? false,
      helpfulCount: json['helpfulCount'] as int? ?? 0,
    );
  }

  String get formattedTimestamp {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
