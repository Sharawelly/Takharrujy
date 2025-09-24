import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/file_upload_widget.dart';
import '../widgets/task_progress_tracker.dart';
import '../widgets/submission_guidelines_widget.dart';
import '../widgets/task_details_card.dart';
import '../widgets/submit_work_card.dart';
import '../widgets/submit_action_buttons.dart';
import '../../data/models/task_model.dart';

class SubmitTaskScreen extends StatefulWidget {
  final TaskModel task;

  const SubmitTaskScreen({super.key, required this.task});

  @override
  State<SubmitTaskScreen> createState() => _SubmitTaskScreenState();
}

class _SubmitTaskScreenState extends State<SubmitTaskScreen> {
  final _notesController = TextEditingController();
  final _statusController = TextEditingController();

  List<UploadedFile> _uploadedFiles = [
    const UploadedFile(
      name: 'Literature_Review_Final.pdf',
      size: '2.5 MB',
      type: 'pdf',
      path: '/path/to/file.pdf',
    ),
    const UploadedFile(
      name: 'References.docx',
      size: '1.8 MB',
      type: 'docx',
      path: '/path/to/file.docx',
    ),
  ];

  @override
  void dispose() {
    _notesController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: StandardAppBar(
        title: 'Submit Task',
        showNotifications: false,
        showAvatar: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Details Card
            TaskDetailsCard(task: widget.task),
            SizedBox(height: 16.h),

            // Task Progress
            TaskProgressTracker(currentStep: ProgressStep.submit),
            SizedBox(height: 16.h),

            // Submit Work Card
            SubmitWorkCard(
              uploadedFiles: _uploadedFiles,
              onFilesChanged: (files) => setState(() => _uploadedFiles = files),
              onBrowseFiles: _browseFiles,
              notesController: _notesController,
              statusController: _statusController,
              onStatusChanged: (value) {
                setState(() {
                  _statusController.text = value ?? '';
                });
              },
            ),
            SizedBox(height: 16.h),

            // Submission Guidelines
            const SubmissionGuidelinesWidget(),
            SizedBox(height: 16.h),

            // Action Buttons
            SubmitActionButtons(
              onSaveDraft: _saveDraft,
              onSubmitTask: _submitTask,
            ),
          ],
        ),
      ),
    );
  }

  void _browseFiles() {
    // TODO: Implement file picker
    // For now, add a sample file
    setState(() {
      _uploadedFiles.add(
        UploadedFile(
          name: 'Sample_File_${_uploadedFiles.length + 1}.pdf',
          size: '1.2 MB',
          type: 'pdf',
          path: '/path/to/sample_file.pdf',
        ),
      );
    });
  }

  void _saveDraft() {
    // TODO: Implement save draft functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Draft saved successfully'),
        backgroundColor: Color(0xFF22C55E),
      ),
    );
  }

  void _submitTask() {
    if (_statusController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a status'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    // TODO: Implement submit task functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task submitted successfully'),
        backgroundColor: Color(0xFF22C55E),
      ),
    );
  }
}
