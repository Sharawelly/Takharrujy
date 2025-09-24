import '../../data/models/project_model.dart';
import '../../data/models/team_member_model.dart';
import '../../../../features/tasks/data/models/task_model.dart';
import '../widgets/recent_activity_widget.dart';

class ProjectSampleDataWidget {
  static ProjectModel getSampleProject() {
    return ProjectModel(
      id: '1',
      title: 'Mobile App Development',
      description:
          'A comprehensive mobile application for university student services',
      status: ProjectStatus.inProgress,
      dueDate: DateTime(2025, 5, 20),
      progress: 65.0,
      supervisorId: '1',
      supervisorName: 'Dr. Ahmed Hassan',
      supervisorDepartment: 'Computer Science',
      teamMemberIds: ['1', '2', '3'],
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime.now(),
    );
  }

  static List<TeamMemberModel> getSampleTeamMembers() {
    return [
      TeamMemberModel(
        id: '1',
        name: 'Sarah Al-Mansouri',
        email: 'sarah@example.com',
        role: TeamMemberRole.teamLead,
        status: TeamMemberStatus.online,
        projectId: '1',
      ),
      TeamMemberModel(
        id: '2',
        name: 'Omar Khalil',
        email: 'omar@example.com',
        role: TeamMemberRole.developer,
        status: TeamMemberStatus.online,
        projectId: '1',
      ),
      TeamMemberModel(
        id: '3',
        name: 'Fatima Al-Zahra',
        email: 'fatima@example.com',
        role: TeamMemberRole.designer,
        status: TeamMemberStatus.away,
        projectId: '1',
      ),
    ];
  }

  static List<TaskModel> getSampleTasks() {
    return [
      TaskModel(
        id: '1',
        title: 'Database Design',
        description: 'Design the database schema for the mobile app',
        status: TaskStatus.inProgress,
        priority: TaskPriority.high,
        dueDate: DateTime(2025, 3, 15),
        assignedBy: 'Omar Khalil',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      TaskModel(
        id: '2',
        title: 'UI Wireframes',
        description: 'Create wireframes for main app screens',
        status: TaskStatus.completed,
        priority: TaskPriority.medium,
        dueDate: DateTime(2025, 3, 10),
        assignedBy: 'Fatima Al-Zahra',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      TaskModel(
        id: '3',
        title: 'API Integration',
        description: 'Integrate university API services',
        status: TaskStatus.toDo,
        priority: TaskPriority.low,
        dueDate: DateTime(2025, 3, 20),
        assignedBy: 'Sarah Al-Mansouri',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  static List<ActivityItem> getSampleActivities() {
    return [
      const ActivityItem(
        id: '1',
        description: 'Task "UI Design" completed',
        user: 'Fatima Al-Zahra',
        timeAgo: '2 hours ago',
        type: ActivityType.taskCompleted,
      ),
      const ActivityItem(
        id: '2',
        description: 'New task "API Testing" created',
        user: 'Sarah Al-Mansouri',
        timeAgo: '4 hours ago',
        type: ActivityType.taskCreated,
      ),
    ];
  }
}
