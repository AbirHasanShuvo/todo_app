import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTask(taskState.tasks);
    final incompletedTasks = _incompletedTask(taskState.tasks);

    return Scaffold(
      body: Column(
        children: [
          // ✅ Header section (fixed height)
          Container(
            height: deviceSize.height * 0.3,
            width: double.infinity,
            color: colors.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DisplayWhiteText(text: '19 September, 2025', fontsize: 20),
                DisplayWhiteText(
                  text: 'My Todo List',
                  fontsize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),

          // ✅ Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Incomplete tasks
                    DisplayListOfTask(tasks: incompletedTasks),

                    const SizedBox(height: 20),

                    // Completed tasks
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const SizedBox(height: 20),

                    DisplayListOfTask(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),

                    const SizedBox(height: 20),

                    // Add new task button
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Text('Add New Task'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  List<Task> _completedTask(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }

  List<Task> _incompletedTask(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      //not completed tasks
      if (!task.isCompleted) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }
}
