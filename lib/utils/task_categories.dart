import 'package:flutter/material.dart';

enum TaskCategories {
  education(Colors.blueGrey, Icons.school),
  health(Colors.orange, Icons.favorite_outline_outlined),
  home(Colors.green, Icons.home),
  others(Colors.purple, Icons.calendar_month),
  personal(Colors.lightBlue, Icons.person),
  shopping(Colors.pink, Icons.shopping_bag),
  social(Colors.brown, Icons.school),
  travel(Colors.deepOrange, Icons.flight),
  work(Colors.amber, Icons.work);

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategories.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategories(this.color, this.icon);
}
