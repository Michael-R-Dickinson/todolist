import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/compact_mode_provider.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/task_item/base_task.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BaseTaskItem(
              id: tasks[index].id,
            );
          },
          itemCount: tasks.length,
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(compactModeProvider.notifier).toggle();
          },
          child: const Text('PRESS ME'),
        ),
      ],
    );
  }
}
