import 'package:equatable/equatable.dart';

class AiRequestModel extends Equatable {
  final String taskId;
  final String assistanceType;
  final String question;
  final List<String>? attachedFiles;
  final DateTime timestamp;

  const AiRequestModel({
    required this.taskId,
    required this.assistanceType,
    required this.question,
    this.attachedFiles,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
    taskId,
    assistanceType,
    question,
    attachedFiles,
    timestamp,
  ];

  AiRequestModel copyWith({
    String? taskId,
    String? assistanceType,
    String? question,
    List<String>? attachedFiles,
    DateTime? timestamp,
  }) {
    return AiRequestModel(
      taskId: taskId ?? this.taskId,
      assistanceType: assistanceType ?? this.assistanceType,
      question: question ?? this.question,
      attachedFiles: attachedFiles ?? this.attachedFiles,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'assistanceType': assistanceType,
      'question': question,
      'attachedFiles': attachedFiles,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory AiRequestModel.fromJson(Map<String, dynamic> json) {
    return AiRequestModel(
      taskId: json['taskId'] as String,
      assistanceType: json['assistanceType'] as String,
      question: json['question'] as String,
      attachedFiles: json['attachedFiles'] != null
          ? List<String>.from(json['attachedFiles'])
          : null,
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
