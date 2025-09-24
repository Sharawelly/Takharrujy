import 'package:equatable/equatable.dart';

enum ProjectStatus { planning, inProgress, completed, onHold }

class ProjectModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final ProjectStatus status;
  final DateTime dueDate;
  final double progress;
  final String supervisorId;
  final String supervisorName;
  final String supervisorDepartment;
  final List<String> teamMemberIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.progress,
    required this.supervisorId,
    required this.supervisorName,
    required this.supervisorDepartment,
    required this.teamMemberIds,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    status,
    dueDate,
    progress,
    supervisorId,
    supervisorName,
    supervisorDepartment,
    teamMemberIds,
    createdAt,
    updatedAt,
  ];

  ProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    ProjectStatus? status,
    DateTime? dueDate,
    double? progress,
    String? supervisorId,
    String? supervisorName,
    String? supervisorDepartment,
    List<String>? teamMemberIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      progress: progress ?? this.progress,
      supervisorId: supervisorId ?? this.supervisorId,
      supervisorName: supervisorName ?? this.supervisorName,
      supervisorDepartment: supervisorDepartment ?? this.supervisorDepartment,
      teamMemberIds: teamMemberIds ?? this.teamMemberIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: ProjectStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ProjectStatus.planning,
      ),
      dueDate: DateTime.parse(json['dueDate']),
      progress: (json['progress'] as num).toDouble(),
      supervisorId: json['supervisorId'] as String,
      supervisorName: json['supervisorName'] as String,
      supervisorDepartment: json['supervisorDepartment'] as String,
      teamMemberIds: List<String>.from(json['teamMemberIds']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.name,
      'dueDate': dueDate.toIso8601String(),
      'progress': progress,
      'supervisorId': supervisorId,
      'supervisorName': supervisorName,
      'supervisorDepartment': supervisorDepartment,
      'teamMemberIds': teamMemberIds,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

extension ProjectStatusExtension on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.planning:
        return 'Planning';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.onHold:
        return 'On Hold';
    }
  }

  String get shortName {
    switch (this) {
      case ProjectStatus.planning:
        return 'Planning';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.onHold:
        return 'On Hold';
    }
  }
}
