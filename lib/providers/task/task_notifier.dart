import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/models/models.dart';
import 'package:todo_app/data/repositories/repositories.dart';
import 'package:todo_app/providers/task/task_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  TaskNotifier(this._repository) : super(TaskState.initial()) {
    //load all task as soon as the appp
    getTasks();
  }

  final TaskRepository _repository;

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //for deleting purposes

  Future<void> deleteTasks(Task task) async {
    try {
      await _repository.deleteTasks(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTasks(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
