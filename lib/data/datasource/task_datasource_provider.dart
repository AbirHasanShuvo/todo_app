import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/datasource/task_datasource.dart';
import 'package:todo_app/data/repositories/task_repositories.dart';

final taskdataSourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
