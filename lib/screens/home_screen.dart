import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extension.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
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
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                // physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTask(
                      tasks: [
                        Task(
                          title: 'Title 1',
                          note: 'note',
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

                    SizedBox(height: 20),

                    Text('Completed', style: context.textTheme.headlineMedium),
                    SizedBox(height: 20),

                    DisplayListOfTask(tasks: [
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
                    ], isCompletedTasks: true),

                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Add New Task'),
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
