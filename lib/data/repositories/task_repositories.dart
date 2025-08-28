import 'package:todo_app/data/models/task.dart';

abstract class TaskRepository {
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTasks(Task task);
  Future<List<Task>> getAllTasks();
}
