import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/todo_provider.dart';
import 'package:todolist/widgets/task_item/base_task.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return BaseTaskItem(
            id: tasks[index].id,
            isCompactMode: false,
          );
        },
        itemCount: tasks.length,
      ),
      // Column(
      //   children:
      //   [
      //     BaseTaskItem(
      //       name: "Website for Rune.io",
      //       isCompactMode: true,
      //     ),
      //   ],
      // ),
    );
  }
}
