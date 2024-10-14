import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/providers/view_settings_provider.dart';
import 'package:todolist/utils.dart';
import 'package:todolist/widgets/task_item/compact_task.dart';
import 'package:todolist/widgets/task_item/default_task.dart';

class TaskItemWrapper extends StatelessWidget {
  final Widget child;
  final bool isCompactMode;
  final bool? selected;
  const TaskItemWrapper({
    super.key,
    required this.child,
    required this.isCompactMode,
    this.selected,
  });

  BoxShadow makeShadow(Color color) {
    if (isCompactMode) {
      return BoxShadow(
        color: color,
        spreadRadius: -3,
        offset: const Offset(-7, -7),
      );
    }

    return makeDefaultBoxShadow(color);
  }

  @override
  Widget build(BuildContext context) {
    final double yPadding = !isCompactMode ? 16 : 12;
    const double xPadding = 16;

    Color boxColor;
    switch (selected) {
      case true:
        boxColor = Colors.green[700]!;
      case false:
        boxColor = Colors.black;
      case null:
        boxColor = Colors.black;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      padding: EdgeInsets.fromLTRB(xPadding, yPadding, xPadding, yPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [makeShadow(boxColor)],
        borderRadius: taskBorderRadius,
        border: Border.all(
          color: boxColor,
          style: BorderStyle.solid,
          width: selected == true ? 2 : 1,
        ),
      ),
      child: child,
    );
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
    final bool isCompactMode = ref.watch(viewSettingsProvider).compactMode;

    return TaskItemWrapper(
      isCompactMode: isCompactMode,
      child: isCompactMode ? CompactTaskItem(id: id) : DefaultTaskItem(id: id),
    );
  }
}
