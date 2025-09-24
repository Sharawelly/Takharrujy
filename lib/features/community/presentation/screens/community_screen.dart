import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/router/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../data/models/community_project_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import '../widgets/community_body_widget.dart';
import '../../domain/services/community_service.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final CommunityService _communityService = CommunityService();

  // Filter values
  String _selectedFaculty = CommunityConstants.facultyOptions.first;
  String _selectedDepartment = CommunityConstants.departmentOptions.first;
  String _selectedStatus = CommunityConstants.statusOptions.first;
  String _selectedSort = CommunityConstants.sortOptions.first;

  // Projects data
  late List<CommunityProjectModel> _allProjects;
  late List<CommunityProjectModel> _filteredProjects;

  @override
  void initState() {
    super.initState();
    _allProjects = _communityService.getSampleProjects();
    _filteredProjects = _allProjects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Community Projects',
        showNotifications: true,
        showAvatar: true,
        onNotificationPressed: () => context.push(AppRouter.notificationsRoute),
        onProfilePressed: () => context.push(AppRouter.profileRoute),
        onSettingsPressed: () => context.push(AppRouter.settingsRoute),
        avatarImage: AppImages.sara,
      ),
      body: CommunityBodyWidget(
        selectedFaculty: _selectedFaculty,
        selectedDepartment: _selectedDepartment,
        selectedStatus: _selectedStatus,
        selectedSort: _selectedSort,
        filteredProjects: _filteredProjects,
        onFacultyChanged: _onFacultyChanged,
        onDepartmentChanged: _onDepartmentChanged,
        onStatusChanged: _onStatusChanged,
        onSearchPressed: _searchProjects,
        onSortPressed: _showSortOptions,
        onJoinProject: _joinProject,
        onViewProject: _viewProject,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/community',
      ),
    );
  }

  void _onFacultyChanged(String? value) {
    setState(() {
      _selectedFaculty = value!;
      _applyFilters();
    });
  }

  void _onDepartmentChanged(String? value) {
    setState(() {
      _selectedDepartment = value!;
      _applyFilters();
    });
  }

  void _onStatusChanged(String? value) {
    setState(() {
      _selectedStatus = value!;
      _applyFilters();
    });
  }

  void _applyFilters() {
    _filteredProjects = _communityService.filterProjects(
      projects: _allProjects,
      faculty: _selectedFaculty,
      department: _selectedDepartment,
      status: _selectedStatus,
    );
    _filteredProjects = _communityService.sortProjects(
      projects: _filteredProjects,
      sortBy: _selectedSort,
    );
  }

  void _searchProjects() {
    _applyFilters();
    _communityService.showInfoMessage(
      context,
      '${CommunityConstants.searchMessage}: $_selectedFaculty, $_selectedDepartment, $_selectedStatus',
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sort by',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            ...CommunityConstants.sortOptions.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    _selectedSort = option;
                    _applyFilters();
                  });
                  Navigator.pop(context);
                },
                trailing: _selectedSort == option
                    ? const Icon(Icons.check, color: AppColors.primary)
                    : null,
              );
            }),
          ],
        ),
      ),
    );
  }

  void _joinProject(CommunityProjectModel project) {
    _communityService.showSuccessMessage(
      context,
      '${CommunityConstants.joinRequestMessage} "${project.title}" sent!',
    );
  }

  void _viewProject(CommunityProjectModel project) {
    _communityService.showInfoMessage(
      context,
      '${CommunityConstants.viewDetailsMessage} "${project.title}"',
    );
  }
}
