import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TaskFormController extends ChangeNotifier {
  // Form controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();

  // Form values
  TaskPriority selectedPriority = TaskPriority.low;
  String selectedMember = 'Select team member';
  TaskStatus selectedStatus = TaskStatus.toDo;

  // Project progress data
  final double overallCompletion = 0.68;
  final int totalTasks = 12;
  final int completedTasks = 8;
  final int pendingTasks = 4;

  // Task list data
  final List<TaskModel> tasks = [
    TaskModel(
      id: '1',
      title: 'Research Literature Review',
      description: 'Conduct comprehensive research on existing literature',
      priority: TaskPriority.high,
      status: TaskStatus.inProgress,
      assignedBy: 'Ahmed Hassan',
      dueDate: DateTime(2025, 2, 15),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TaskModel(
      id: '2',
      title: 'System Architecture Design',
      description: 'Design the overall system architecture',
      priority: TaskPriority.medium,
      status: TaskStatus.completed,
      assignedBy: 'Sara Mohamed',
      dueDate: DateTime(2025, 2, 20),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    TaskModel(
      id: '3',
      title: 'Database Schema Planning',
      description: 'Plan and design the database schema',
      priority: TaskPriority.low,
      status: TaskStatus.toDo,
      assignedBy: 'Omar Ali',
      dueDate: DateTime(2025, 2, 25),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  void updatePriority(TaskPriority priority) {
    selectedPriority = priority;
    notifyListeners();
  }

  void updateMember(String member) {
    selectedMember = member;
    notifyListeners();
  }

  void updateStatus(TaskStatus status) {
    selectedStatus = status;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      deadlineController.text =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      notifyListeners();
    }
  }

  void submitTask(BuildContext context) {
    // Handle task submission
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task created successfully!'),
        backgroundColor: Color(0xFF16A34A),
      ),
    );
    resetForm();
  }

  void resetForm() {
    titleController.clear();
    descriptionController.clear();
    deadlineController.clear();
    selectedPriority = TaskPriority.low;
    selectedMember = 'Select team member';
    selectedStatus = TaskStatus.toDo;
    notifyListeners();
  }

  void editTask(BuildContext context, TaskModel task) {
    // Handle task editing
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit task: ${task.title}')));
  }

  void deleteTask(BuildContext context, TaskModel task) {
    // Handle task deletion
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Delete task: ${task.title}')));
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    deadlineController.dispose();
    super.dispose();
  }
}
