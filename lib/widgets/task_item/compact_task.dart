import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/project_provider.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/task_item/task_text.dart';

class CompactTaskItem extends ConsumerWidget {
  final String id;
  const CompactTaskItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ! Investigate using select
    final task = ref.watch(taskProvider(id));
    if (task == null) return const SizedBox.shrink();
    final project = task.projectId != null
        ? ref.watch(projectProvider(task.projectId!))
        : null;

    return Row(children: [
      TaskText(
        title: task.name.toString(),
        projectName: project?.name,
        projectAccentColor: project?.color,
        useLongerProjectGap: true,
      ),
    ]);
  }
}
