import 'package:todo_app/data/datasource/task_datasource.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/repositories/task_repositories.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _datasource;

  TaskRepositoryImpl(this._datasource);

  @override
  Future<void> createTask(Task task) async {
    try {
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await _datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTasks(Task task) async {
    try {
      await _datasource.deleteTasks(task);
    } catch (e) {
      throw '$e';
    }
  }
}
