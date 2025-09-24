import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:takharrujy/core/router/app_router.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/project_form.dart';
import '../widgets/team_member_widget.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form Controllers
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _supervisorController = TextEditingController();
  final _categoryController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  // Form State
  List<TeamMember> _teamMembers = [
    const TeamMember(
      id: '1',
      name: 'Ahmed Student',
      email: 'ahmed@example.com',
      isLeader: true,
    ),
  ];

  String? _selectedSupervisor;
  String? _selectedCategory;
  DateTime? _startDate;
  DateTime? _endDate;

  final List<String> _supervisors = [
    'Dr. Smith',
    'Dr. Johnson',
    'Dr. Williams',
    'Dr. Brown',
  ];

  final List<String> _categories = [
    'Software Engineering',
    'Data Science',
    'Machine Learning',
    'Web Development',
    'Mobile Development',
    'Cybersecurity',
    'Artificial Intelligence',
    'Database Systems',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _supervisorController.dispose();
    _categoryController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Create New Project',
        showNotifications: true,
        showAvatar: true,
        onNotificationPressed: () => context.push(AppRouter.notificationsRoute),
        onProfilePressed: () => context.push(AppRouter.profileRoute),
        onSettingsPressed: () => context.push(AppRouter.settingsRoute),
        avatarImage: AppImages.sara,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/create-project',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb

            // Header
            _buildHeader(),
            SizedBox(height: 20.h),

            // Form
            ProjectForm(
              formKey: _formKey,
              titleController: _titleController,
              descriptionController: _descriptionController,
              teamMembers: _teamMembers,
              selectedSupervisor: _selectedSupervisor,
              selectedCategory: _selectedCategory,
              startDate: _startDate,
              endDate: _endDate,
              supervisors: _supervisors,
              categories: _categories,
              onTeamMembersChanged: (members) =>
                  setState(() => _teamMembers = members),
              onSupervisorChanged: (value) =>
                  setState(() => _selectedSupervisor = value),
              onCategoryChanged: (value) =>
                  setState(() => _selectedCategory = value),
              onStartDateSelected: (date) => setState(() => _startDate = date),
              onEndDateSelected: (date) => setState(() => _endDate = date),
              onCreateProject: _createProject,
              onResetForm: _resetForm,
              onSaveDraft: _saveDraft,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Fill in the details below to create your graduation project',
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
    );
  }

  void _createProject() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Please select a project category'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      if (_startDate == null || _endDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Please select start and end dates'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      if (_startDate!.isAfter(_endDate!)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('End date must be after start date'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      // TODO: Implement create project functionality
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Project created successfully!'),
          backgroundColor: AppColors.success,
        ),
      );

      // Navigate back to dashboard
      context.go('/dashboard');
    }
  }

  void _resetForm() {
    setState(() {
      _titleController.clear();
      _descriptionController.clear();
      _supervisorController.clear();
      _categoryController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _selectedSupervisor = null;
      _selectedCategory = null;
      _startDate = null;
      _endDate = null;
      _teamMembers = [
        const TeamMember(
          id: '1',
          name: 'Ahmed Student',
          email: 'ahmed@example.com',
          isLeader: true,
        ),
      ];
    });
  }

  void _saveDraft() {
    // TODO: Implement save draft functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Draft saved successfully'),
        backgroundColor: AppColors.success,
      ),
    );
  }
}
