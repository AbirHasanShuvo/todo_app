import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge),
          SizedBox(width: 10),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final category = categories[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleContainer(
                    color: category.color.withOpacity(0.3),
                    child: Icon(
                      category.icon,
                      color: category == selectedCategory
                          ? context.colorScheme.primary
                          : category.color,
                      size: 20,
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) => SizedBox(width: 8),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
