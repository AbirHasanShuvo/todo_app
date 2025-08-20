import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extension.dart';
import 'package:todo_app/widgets/common_contailer.dart';
import 'package:todo_app/widgets/task_tile.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });
  final List<Task> tasks;
  final bool isCompletedTasks;
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTasks
        ? deviceSize.height * 0.25
        : deviceSize.height * 3;
    final emptyTaskMessage = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to do!';
    return CommonContailer(
      height: deviceSize.height * 0.25,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,

              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (ctx, index) {
                final task = tasks[index];

                return TaskTile(task: task);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 1.5);
              },
            ),
    );
  }
}
