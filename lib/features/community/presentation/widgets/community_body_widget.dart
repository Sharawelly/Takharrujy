import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/community_project_model.dart';
import 'community_header.dart';
import 'community_filter_section.dart';
import 'community_project_list_header.dart';
import 'community_project_list.dart';

class CommunityBodyWidget extends StatelessWidget {
  final String selectedFaculty;
  final String selectedDepartment;
  final String selectedStatus;
  final String selectedSort;
  final List<CommunityProjectModel> filteredProjects;
  final Function(String?) onFacultyChanged;
  final Function(String?) onDepartmentChanged;
  final Function(String?) onStatusChanged;
  final VoidCallback onSearchPressed;
  final VoidCallback onSortPressed;
  final Function(CommunityProjectModel) onJoinProject;
  final Function(CommunityProjectModel) onViewProject;

  const CommunityBodyWidget({
    super.key,
    required this.selectedFaculty,
    required this.selectedDepartment,
    required this.selectedStatus,
    required this.selectedSort,
    required this.filteredProjects,
    required this.onFacultyChanged,
    required this.onDepartmentChanged,
    required this.onStatusChanged,
    required this.onSearchPressed,
    required this.onSortPressed,
    required this.onJoinProject,
    required this.onViewProject,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommunityHeader(),
          SizedBox(height: 24.h),
          _buildFilterSection(),
          SizedBox(height: 24.h),
          _buildProjectListHeader(),
          SizedBox(height: 20.h),
          _buildProjectList(),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return CommunityFilterSection(
      selectedFaculty: selectedFaculty,
      selectedDepartment: selectedDepartment,
      selectedStatus: selectedStatus,
      onFacultyChanged: onFacultyChanged,
      onDepartmentChanged: onDepartmentChanged,
      onStatusChanged: onStatusChanged,
      onSearchPressed: onSearchPressed,
    );
  }

  Widget _buildProjectListHeader() {
    return CommunityProjectListHeader(
      projectCount: filteredProjects.length,
      selectedSort: selectedSort,
      onSortPressed: onSortPressed,
    );
  }

  Widget _buildProjectList() {
    return CommunityProjectList(
      projects: filteredProjects,
      onJoinProject: onJoinProject,
      onViewProject: onViewProject,
    );
  }
}
