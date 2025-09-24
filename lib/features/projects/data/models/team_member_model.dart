import 'package:equatable/equatable.dart';

enum TeamMemberRole { teamLead, developer, designer, tester, analyst }

enum TeamMemberStatus { online, offline, away }

class TeamMemberModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final TeamMemberRole role;
  final TeamMemberStatus status;
  final String? avatar;
  final String projectId;

  const TeamMemberModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    this.avatar,
    required this.projectId,
  });

  @override
  List<Object?> get props => [id, name, email, role, status, avatar, projectId];

  TeamMemberModel copyWith({
    String? id,
    String? name,
    String? email,
    TeamMemberRole? role,
    TeamMemberStatus? status,
    String? avatar,
    String? projectId,
  }) {
    return TeamMemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
      avatar: avatar ?? this.avatar,
      projectId: projectId ?? this.projectId,
    );
  }

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: TeamMemberRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => TeamMemberRole.developer,
      ),
      status: TeamMemberStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => TeamMemberStatus.offline,
      ),
      avatar: json['avatar'] as String?,
      projectId: json['projectId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role.name,
      'status': status.name,
      'avatar': avatar,
      'projectId': projectId,
    };
  }
}

extension TeamMemberRoleExtension on TeamMemberRole {
  String get displayName {
    switch (this) {
      case TeamMemberRole.teamLead:
        return 'Team Lead';
      case TeamMemberRole.developer:
        return 'Developer';
      case TeamMemberRole.designer:
        return 'Designer';
      case TeamMemberRole.tester:
        return 'Tester';
      case TeamMemberRole.analyst:
        return 'Analyst';
    }
  }
}

extension TeamMemberStatusExtension on TeamMemberStatus {
  String get displayName {
    switch (this) {
      case TeamMemberStatus.online:
        return 'Online';
      case TeamMemberStatus.offline:
        return 'Offline';
      case TeamMemberStatus.away:
        return 'Away';
    }
  }
}
