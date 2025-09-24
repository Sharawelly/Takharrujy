import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';

class TaskDataProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(
      id: '1',
      title: 'Literature Review',
      description:
          'Complete comprehensive literature review for the project proposal including 15+ academic sources.',
      status: TaskStatus.inProgress,
      priority: TaskPriority.high,
      dueDate: DateTime(2025, 1, 25),
      assignedBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    TaskModel(
      id: '2',
      title: 'System Design Document',
      description:
          'Create detailed system architecture and design document with UML diagrams.',
      status: TaskStatus.toDo,
      priority: TaskPriority.medium,
      dueDate: DateTime(2025, 2, 5),
      assignedBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    TaskModel(
      id: '3',
      title: 'Database Schema',
      description: 'Design and implement the database schema for the project.',
      status: TaskStatus.completed,
      priority: TaskPriority.low,
      dueDate: DateTime(2025, 1, 15),
      completedDate: DateTime(2025, 1, 15),
      assignedBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime(2025, 1, 15),
    ),
    TaskModel(
      id: '4',
      title: 'Prototype Development',
      description:
          'Develop initial prototype of the main application features.',
      status: TaskStatus.toDo,
      priority: TaskPriority.high,
      dueDate: DateTime(2025, 2, 20),
      assignedBy: 'Dr. Smith',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now(),
    ),
  ];

  List<TaskModel> get tasks => _tasks;

  void updateTask(TaskModel updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  List<TaskModel> getFilteredTasks({
    String searchQuery = '',
    TaskStatus? selectedStatus,
    TaskPriority? selectedPriority,
  }) {
    return _tasks.where((task) {
      // Search filter
      if (searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        if (!task.title.toLowerCase().contains(query) &&
            !task.description.toLowerCase().contains(query)) {
          return false;
        }
      }

      // Status filter
      if (selectedStatus != null && task.status != selectedStatus) {
        return false;
      }

      // Priority filter
      if (selectedPriority != null && task.priority != selectedPriority) {
        return false;
      }

      return true;
    }).toList();
  }

  Map<String, int> calculateStatistics() {
    return {
      'total': _tasks.length,
      'toDo': _tasks.where((task) => task.status == TaskStatus.toDo).length,
      'inProgress': _tasks
          .where((task) => task.status == TaskStatus.inProgress)
          .length,
      'completed': _tasks
          .where((task) => task.status == TaskStatus.completed)
          .length,
    };
  }

  void handleTaskAction(TaskModel task) {
    switch (task.status) {
      case TaskStatus.toDo:
        // Start task
        updateTask(
          task.copyWith(
            status: TaskStatus.inProgress,
            updatedAt: DateTime.now(),
          ),
        );
        break;
      case TaskStatus.inProgress:
        // Submit task
        updateTask(
          task.copyWith(
            status: TaskStatus.completed,
            completedDate: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
        break;
      case TaskStatus.completed:
        // View submission
        // TODO: Navigate to submission view
        break;
    }
  }
}
