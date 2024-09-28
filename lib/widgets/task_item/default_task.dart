import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/todo_provider.dart';
import 'package:todolist/widgets/completion_circle.dart';
import 'package:todolist/widgets/task_item/task_chip.dart';
import 'package:todolist/widgets/task_item/task_text.dart';
import 'package:todolist/widgets/vertical_line_divider.dart';

class DefaultTaskItem extends StatelessWidget {
  final String id;
  const DefaultTaskItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        TaskBasicInfo(id: id),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          // alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const IconTextTaskChip(),
            const VerticalLineDivider(),
            DueDateTaskChip(
                dueDate: DateTime.now().add(const Duration(days: 3))),
            const VerticalLineDivider(),
            DueDateTaskChip(
              dueDate: DateTime.now().add(const Duration(days: 200)),
            ),
          ],
        ),
      ],
    );
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child:
                    TaskText(title: task.name, description: task.description),
              ),
            ],
          ),
        ),
        const ProgressCircle(percent: 0.5),
      ],
    );
  }
}
