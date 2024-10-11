import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/planner_task.dart';

class PlannerTaskList extends ConsumerWidget {
  const PlannerTaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return PlannerTask(id: tasks[index].id);
        },
      ),
    );
  }
}
