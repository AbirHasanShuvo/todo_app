import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/datasource/task_datasource_provider.dart';
import 'package:todo_app/data/repositories/repositories.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskdataSourceProvider);
  return TaskRepositoryImpl(datasource);
});
