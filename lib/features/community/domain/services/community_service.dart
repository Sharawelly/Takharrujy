import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../data/models/community_project_model.dart';

class CommunityService {
  /// Get sample projects data
  List<CommunityProjectModel> getSampleProjects() {
    return [
      CommunityProjectModel(
        id: '1',
        title: 'AI-Powered Learning Platform',
        description:
            'Developing an adaptive learning system using machine learning algorithms to personalize education for students.',
        status: ProjectStatus.open,
        currentMembers: 3,
        maxMembers: 5,
        department: 'Computer Science',
        supervisor: 'Dr. Sarah Ahmed',
        supervisorStatus: ProjectAvailability.available,
        dueDate: DateTime(2025, 1, 15),
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      CommunityProjectModel(
        id: '2',
        title: 'Smart City IoT Solutions',
        description:
            'Creating IoT infrastructure for smart city management including traffic control, waste management, and energy optimization.',
        status: ProjectStatus.full,
        currentMembers: 4,
        maxMembers: 4,
        department: 'Engineering',
        supervisor: 'Prof. Hassan',
        supervisorStatus: ProjectAvailability.available,
        dueDate: DateTime(2025, 1, 10),
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CommunityProjectModel(
        id: '3',
        title: 'E-commerce Analytics',
        description:
            'Building comprehensive analytics platform for e-commerce businesses to track customer behavior and optimize sales.',
        status: ProjectStatus.open,
        currentMembers: 2,
        maxMembers: 4,
        department: 'Business',
        supervisor: 'Not Assigned',
        supervisorStatus: ProjectAvailability.notAssigned,
        dueDate: DateTime(2025, 1, 20),
        createdAt: DateTime.now().subtract(const Duration(days: 8)),
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CommunityProjectModel(
        id: '4',
        title: 'Renewable Energy Optimizer',
        description:
            'Optimizing renewable energy distribution using advanced algorithms to maximize efficiency and reduce costs.',
        status: ProjectStatus.open,
        currentMembers: 1,
        maxMembers: 3,
        department: 'Engineering',
        supervisor: 'Dr. Al-Rashid',
        supervisorStatus: ProjectAvailability.available,
        dueDate: DateTime(2025, 1, 18),
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  /// Filter projects based on criteria
  List<CommunityProjectModel> filterProjects({
    required List<CommunityProjectModel> projects,
    String? faculty,
    String? department,
    String? status,
  }) {
    return projects.where((project) {
      bool matchesFaculty =
          faculty == null ||
          faculty == 'All Faculties' ||
          project.department == faculty;

      bool matchesDepartment =
          department == null ||
          department == 'All Departments' ||
          project.department == department;

      bool matchesStatus =
          status == null ||
          status == 'All Teams' ||
          project.status.displayName == status;

      return matchesFaculty && matchesDepartment && matchesStatus;
    }).toList();
  }

  /// Sort projects
  List<CommunityProjectModel> sortProjects({
    required List<CommunityProjectModel> projects,
    required String sortBy,
  }) {
    switch (sortBy) {
      case 'Alphabetical':
        projects.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Due Date':
        projects.sort((a, b) => a.dueDate.compareTo(b.dueDate));
        break;
      case 'Members':
        projects.sort((a, b) => b.currentMembers.compareTo(a.currentMembers));
        break;
      case 'Recent':
      default:
        projects.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }
    return projects;
  }

  /// Show success message
  void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
      ),
    );
  }

  /// Show info message
  void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
