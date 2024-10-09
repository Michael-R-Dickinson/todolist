import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/project_provider.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/providers/view_settings_provider.dart';
import 'package:todolist/schemas/task.dart';
import 'package:todolist/widgets/completion_circle.dart';
import 'package:todolist/widgets/task_item/task_chip.dart';
import 'package:todolist/widgets/task_item/task_text.dart';
import 'package:todolist/widgets/vertical_line_divider.dart';

class DefaultTaskItem extends ConsumerWidget {
  final String id;
  const DefaultTaskItem({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Task? task = ref.watch(taskProvider(id));
    if (task == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        TaskBasicInfo(id: id),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const IconTextTaskChip(),
            ...displayDateChips(task, ref),
          ],
        ),
      ],
    );
  }

  List<Widget> displayDateChips(Task task, WidgetRef ref) {
    final showDoDateOverDueDate =
        ref.watch(viewSettingsProvider).showDoDateOverDueDate;

    if (showDoDateOverDueDate) {
      return [
        const VerticalLineDivider(),
        if (task.doDate != null)
          DateTaskChip(
            prefix: "Do",
            dueDate: task.doDate!,
          )
        else if (task.dueDate != null)
          DateTaskChip(
            prefix: "Due",
            dueDate: task.dueDate!,
          ),
      ];
    }

    return [
      if (task.dueDate != null) ...[
        const VerticalLineDivider(),
        DateTaskChip(
          prefix: "Due",
          dueDate: task.dueDate!,
        ),
      ],
      if (task.doDate != null) ...[
        const VerticalLineDivider(),
        DateTaskChip(
          prefix: "Do",
          dueDate: task.doDate!,
        ),
      ],
    ];
  }
}

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
