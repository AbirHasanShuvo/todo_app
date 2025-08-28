import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/utils/extension.dart';
import 'package:todo_app/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DisplayWhiteText(text: 'Add new task')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextfield(title: 'Task Title', hintText: 'Task Title'),
            SizedBox(height: 16),
            SizedBox(height: 16),
            SelectCategory(),
            SelectDateTime(),
            SizedBox(height: 16),

            CommonTextfield(maxLines: 6, title: 'Note', hintText: 'Task Note'),
            SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    context.colorScheme.primary, // Change to your desired color
              ),
              onPressed: () {},
              child: DisplayWhiteText(text: 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}
