import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/project_provider.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/completion_circle.dart';
import 'package:todolist/widgets/task_item/task_text.dart';

class TaskBasicInfo extends ConsumerWidget {
  final String id;
  const TaskBasicInfo({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider(id));
    if (task == null) return const SizedBox.shrink();

    final project = task.projectId != null
        ? ref.watch(projectProvider(task.projectId!))
        : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TaskText(
                  title: task.name,
                  description: task.description,
                  projectName: project?.name,
                  projectAccentColor: project?.color,
                  useLongerProjectGap: true,
                ),
              ),
            ],
          ),
        ),
        const ProgressCircle(percent: 0.6),
      ],
    );
  }
}
