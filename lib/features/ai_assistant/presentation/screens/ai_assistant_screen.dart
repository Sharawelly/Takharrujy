import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/router/app_router.dart';
import '../../../tasks/data/models/task_model.dart';
import 'package:takharrujy/core/constants/constants.dart';
import '../widgets/ai_current_task_section.dart';
import '../widgets/ai_ask_assistant_section.dart';
import '../widgets/ai_response_section.dart';
import '../../domain/services/ai_assistant_service.dart';
import '../../data/models/ai_request_model.dart';
import '../../data/models/ai_response_model.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController _questionController = TextEditingController();
  final AiAssistantService _aiService = AiAssistantService();

  // Form values
  String _selectedTask = AiAssistantConstants.chooseTaskPlaceholder;
  String _selectedAssistanceType =
      AiAssistantConstants.selectHelpTypePlaceholder;

  // Sample tasks data
  final List<TaskModel> _availableTasks = [
    TaskModel(
      id: '1',
      title: 'Database Design',
      description: 'Design the database schema for the project',
      priority: TaskPriority.high,
      status: TaskStatus.inProgress,
      assignedBy: 'Dr. Smith',
      dueDate: DateTime(2025, 3, 15),
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    TaskModel(
      id: '2',
      title: 'System Architecture',
      description: 'Design the overall system architecture',
      priority: TaskPriority.medium,
      status: TaskStatus.toDo,
      assignedBy: 'Dr. Johnson',
      dueDate: DateTime(2025, 3, 20),
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  // AI response state
  AiResponseModel? _aiResponse;
  bool _isProcessing = false;
  bool _showResponse = false;

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'AI Assistant',
        showNotifications: true,
        showAvatar: true,
        avatarImage: AppImages.sara,
        onNotificationPressed: () => context.push(AppRouter.notificationsRoute),
        onProfilePressed: () => context.push(AppRouter.profileRoute),
        onSettingsPressed: () => context.push(AppRouter.settingsRoute),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            AiCurrentTaskSection(
              selectedTask: _selectedTask,
              availableTasks: _availableTasks,
              onTaskChanged: (value) {
                setState(() {
                  _selectedTask = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            AiAskAssistantSection(
              selectedAssistanceType: _selectedAssistanceType,
              questionController: _questionController,
              onAssistanceTypeChanged: (value) {
                setState(() {
                  _selectedAssistanceType = value;
                });
              },
              onUploadFiles: _uploadFiles,
              onGetHelp: _getHelp,
              onClearForm: _clearForm,
              isProcessing: _isProcessing,
            ),
            SizedBox(height: 16.h),
            if (_showResponse && _aiResponse != null) ...[
              AiResponseSection(
                aiResponse: _aiResponse!,
                onMarkHelpful: _markHelpful,
                onCopyResponse: _copyResponse,
                onShareResponse: _shareResponse,
                onHandleSchemaQuestions: _handleSchemaQuestions,
              ),
              SizedBox(height: 16.h),
            ],
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentRoute: '/ai-assistant',
      ),
    );
  }

  void _clearForm() {
    setState(() {
      _questionController.clear();
      _selectedAssistanceType = AiAssistantConstants.selectHelpTypePlaceholder;
      _aiResponse = null;
      _showResponse = false;
    });
  }

  Future<void> _getHelp() async {
    final request = AiRequestModel(
      taskId: _getSelectedTaskId(),
      assistanceType: _selectedAssistanceType,
      question: _questionController.text.trim(),
      timestamp: DateTime.now(),
    );

    final validationError = _aiService.validateRequest(request);
    if (validationError != null) {
      _aiService.showErrorMessage(context, validationError);
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      final response = await _aiService.processRequest(request);
      setState(() {
        _aiResponse = response;
        _isProcessing = false;
        _showResponse = true;
      });
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      _aiService.showErrorMessage(
        context,
        'Failed to process request. Please try again.',
      );
    }
  }

  void _uploadFiles() {
    _aiService.showInfoMessage(context, AiAssistantConstants.fileUploadMessage);
  }

  void _handleSchemaQuestions() {
    _aiService.showInfoMessage(context, AiAssistantConstants.schemaHelpMessage);
  }

  void _markHelpful() {
    if (_aiResponse != null) {
      setState(() {
        _aiResponse = _aiResponse!.copyWith(
          isHelpful: !_aiResponse!.isHelpful,
          helpfulCount: _aiResponse!.isHelpful
              ? _aiResponse!.helpfulCount - 1
              : _aiResponse!.helpfulCount + 1,
        );
      });
    }
    _aiService.showSuccessMessage(
      context,
      AiAssistantConstants.feedbackMessage,
    );
  }

  void _copyResponse() {
    if (_aiResponse != null) {
      // In a real app, you would copy to clipboard here
      _aiService.showInfoMessage(context, AiAssistantConstants.copyMessage);
    }
  }

  void _shareResponse() {
    if (_aiResponse != null) {
      // In a real app, you would implement sharing here
      _aiService.showInfoMessage(context, AiAssistantConstants.shareMessage);
    }
  }

  String _getSelectedTaskId() {
    final selectedTask = _availableTasks.firstWhere(
      (task) => task.title == _selectedTask,
      orElse: () => _availableTasks.first,
    );
    return selectedTask.id;
  }
}
