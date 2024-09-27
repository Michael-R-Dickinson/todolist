import 'package:flutter/material.dart';
import 'package:todolist/theme/custom_theme.dart';
import 'package:todolist/widgets/completion_circle.dart';
import 'package:todolist/widgets/task_text.dart';

const titlePlaceholder = "Website for Rune.io";
const descriptionPlaceholder =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit asdf asdfa asdf";

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
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
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

class BaseTaskItem extends StatelessWidget {
  final bool isCompactMode;
  const BaseTaskItem({super.key, required this.isCompactMode});

  @override
  Widget build(BuildContext context) {
    return TaskItemWrapper(
      isCompactMode: isCompactMode,
      child: isCompactMode ? const CompactTaskItem() : const DefaultTaskItem(),
    );
  }
}

class DefaultTaskItem extends StatelessWidget {
  const DefaultTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TaskText(
                    title: titlePlaceholder,
                    description: descriptionPlaceholder),
              ),
            ],
          ),
        ),
        ProgressCircle(percent: 0.5),
      ],
    );
  }
}

class CompactTaskItem extends StatelessWidget {
  const CompactTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskText(title: titlePlaceholder);
  }
}
