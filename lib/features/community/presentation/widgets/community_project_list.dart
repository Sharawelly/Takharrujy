import 'package:flutter/material.dart';
import '../../data/models/community_project_model.dart';
import 'community_project_card.dart';

class CommunityProjectList extends StatelessWidget {
  final List<CommunityProjectModel> projects;
  final Function(CommunityProjectModel) onJoinProject;
  final Function(CommunityProjectModel) onViewProject;

  const CommunityProjectList({
    super.key,
    required this.projects,
    required this.onJoinProject,
    required this.onViewProject,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: projects.map((project) {
        return CommunityProjectCard(
          project: project,
          onJoinPressed: () => onJoinProject(project),
          onViewPressed: () => onViewProject(project),
        );
      }).toList(),
    );
  }
}
