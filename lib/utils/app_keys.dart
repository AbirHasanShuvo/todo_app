import 'package:flutter/foundation.dart';
import 'package:todo_app/utils/utils.dart';

@immutable
class DBKeys {
  const DBKeys._();
  static const String dbName = 'tasks.db';
  static const String dbTable = 'tasks';

  static const String idColumn = TaskKeys.id;
  static const String titleColumn = TaskKeys.title;
  static const String noteColumn = TaskKeys.note;
  static const String timeColumn = TaskKeys.time;
  static const String dateColumn = TaskKeys.date;
  static const String categoriesColumn = TaskKeys.categories;
  static const String isCompletedColumn = TaskKeys.isCompleted;
}
