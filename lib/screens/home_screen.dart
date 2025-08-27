import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                    DisplayListOfTask(
                      tasks: [
                        Task(
                          title: 'Title 1',
                          note: '',
                          time: '10:12',
                          date: 'Aug, 7',
                          isCompleted: false,
                          category: TaskCategories.shopping,
                        ),
                        Task(
                          title: 'Title 2',
                          note: 'note',
                          time: '10:12',
                          date: 'Aug, 7',
                          isCompleted: false,
                          category: TaskCategories.education,
                        ),
                      ],
                    ),
              
                    const SizedBox(height: 20),
              
                    // Completed tasks
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const SizedBox(height: 20),
              
                    DisplayListOfTask(
                      tasks: [
                        Task(
                          title: 'Title 1',
                          note: 'note',
                          time: '10:12',
                          date: 'Aug, 7',
                          isCompleted: true,
                          category: TaskCategories.personal,
                        ),
                        Task(
                          title: 'Title 2',
                          note: 'note',
                          time: '10:12',
                          date: 'Aug, 7',
                          isCompleted: true,
                          category: TaskCategories.work,
                        ),
                      ],
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
}
