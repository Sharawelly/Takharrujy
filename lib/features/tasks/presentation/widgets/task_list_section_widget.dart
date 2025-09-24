import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../data/models/task_model.dart';
import '../widgets/task_card.dart';

class TaskListSectionWidget extends StatelessWidget {
  final List<TaskModel> tasks;
  final Function(TaskModel) onTaskMenuTap;
  final Function(TaskModel) onTaskTap;
  final Function(TaskModel) onTaskAction;

  const TaskListSectionWidget({
    super.key,
    required this.tasks,
    required this.onTaskMenuTap,
    required this.onTaskTap,
    required this.onTaskAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks
          .map(
            (task) => TaskCard(
              task: task,
              onTap: () => onTaskTap(task),
              onDetailsTap: () => onTaskTap(task), // Edit button navigation
              onActionTap: () {
                // Handle task action based on status
                if (task.status == TaskStatus.inProgress) {
                  // Navigate to submit task screen
                  context.push(
                    '${AppRouter.submitTaskRoute}?taskId=${task.id}',
                  );
                } else {
                  onTaskAction(task);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
