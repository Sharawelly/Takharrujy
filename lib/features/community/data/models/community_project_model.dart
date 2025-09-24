import 'package:equatable/equatable.dart';

enum ProjectStatus { open, full, closed }

enum ProjectAvailability { available, notAssigned }

class CommunityProjectModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final ProjectStatus status;
  final int currentMembers;
  final int maxMembers;
  final String department;
  final String supervisor;
  final ProjectAvailability supervisorStatus;
  final DateTime dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CommunityProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.currentMembers,
    required this.maxMembers,
    required this.department,
    required this.supervisor,
    required this.supervisorStatus,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    status,
    currentMembers,
    maxMembers,
    department,
    supervisor,
    supervisorStatus,
    dueDate,
    createdAt,
    updatedAt,
  ];

  CommunityProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    ProjectStatus? status,
    int? currentMembers,
    int? maxMembers,
    String? department,
    String? supervisor,
    ProjectAvailability? supervisorStatus,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CommunityProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      currentMembers: currentMembers ?? this.currentMembers,
      maxMembers: maxMembers ?? this.maxMembers,
      department: department ?? this.department,
      supervisor: supervisor ?? this.supervisor,
      supervisorStatus: supervisorStatus ?? this.supervisorStatus,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory CommunityProjectModel.fromJson(Map<String, dynamic> json) {
    return CommunityProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: ProjectStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ProjectStatus.open,
      ),
      currentMembers: json['currentMembers'] as int,
      maxMembers: json['maxMembers'] as int,
      department: json['department'] as String,
      supervisor: json['supervisor'] as String,
      supervisorStatus: ProjectAvailability.values.firstWhere(
        (e) => e.name == json['supervisorStatus'],
        orElse: () => ProjectAvailability.available,
      ),
      dueDate: DateTime.parse(json['dueDate']),
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
      'currentMembers': currentMembers,
      'maxMembers': maxMembers,
      'department': department,
      'supervisor': supervisor,
      'supervisorStatus': supervisorStatus.name,
      'dueDate': dueDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

extension ProjectStatusExtension on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.open:
        return 'Open';
      case ProjectStatus.full:
        return 'Full';
      case ProjectStatus.closed:
        return 'Closed';
    }
  }
}

extension ProjectAvailabilityExtension on ProjectAvailability {
  String get displayName {
    switch (this) {
      case ProjectAvailability.available:
        return 'Available';
      case ProjectAvailability.notAssigned:
        return 'Not Assigned';
    }
  }
}
