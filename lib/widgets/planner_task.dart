import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/schemas/task.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/task_item/base_task.dart';
import 'package:todolist/widgets/task_item/default_task.dart';
import 'package:todolist/widgets/task_item/task_text.dart';

const selectedShadow = BoxShadow(
  color: Colors.black,
  spreadRadius: -5,
  offset: Offset(0, 10),
);

class PlannerTask extends ConsumerWidget {
  final String id;
  const PlannerTask({super.key, required this.id});

  Task toggleTask(Task task) {
    return task.copyWith(todayTask: !task.todayTask);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Task? task = ref.watch(taskProvider(id));
    if (task == null) return const SizedBox.shrink();

    final selected = task.todayTask;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ref.read(taskListProvider.notifier).updateTask(id, toggleTask(task));
        },
        child: TaskItemWrapper(
          isCompactMode: false,
          selected: selected,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskTitleText(title: task.name),
                    if (task.description != null)
                      TaskDescriptionText(
                        description: task.description!,
                        truncateToOneLine: true,
                      ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...displayDateChips(task, ref),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black12,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "15",
                  style: TextStyle(
                    color: cardElevatedText,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
