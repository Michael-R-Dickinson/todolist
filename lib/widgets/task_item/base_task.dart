import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/compact_mode_provider.dart';
import 'package:todolist/theme/custom_theme.dart';
import 'package:todolist/widgets/task_item/compact_task.dart';
import 'package:todolist/widgets/task_item/default_task.dart';

class TaskItemWrapper extends StatelessWidget {
  final Widget child;
  final bool isCompactMode;
  const TaskItemWrapper({
    super.key,
    required this.child,
    required this.isCompactMode,
  });

  @override
  Widget build(BuildContext context) {
    final double yPadding = !isCompactMode ? 16 : 12;
    const double xPadding = 16;
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.fromLTRB(xPadding, yPadding, xPadding, yPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            if (!isCompactMode) basicShadow,
            if (isCompactMode) compactShadow
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        child: child);
  }
}

class BaseTaskItem extends ConsumerWidget {
  final String id;
  const BaseTaskItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isCompactMode = ref.watch(compactModeProvider);

    return TaskItemWrapper(
      isCompactMode: isCompactMode,
      child: isCompactMode ? CompactTaskItem(id: id) : DefaultTaskItem(id: id),
    );
  }
}
