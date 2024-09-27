import 'package:flutter/material.dart';
import 'package:todolist/widgets/completion_circle.dart';
import 'package:todolist/widgets/task_item/task_chip.dart';
import 'package:todolist/widgets/task_item/task_text.dart';

const titlePlaceholder = "Website for Rune.io";
const descriptionPlaceholder =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit asdf asdfa asdf";

class DefaultTaskItem extends StatelessWidget {
  const DefaultTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const TaskBasicInfo(),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          children: [
            const IconTextTaskChip(),
            DueDateTaskChip(dueDate: DateTime.now()),
          ],
        ),
      ],
    );
  }
}

class TaskBasicInfo extends StatelessWidget {
  const TaskBasicInfo({
    super.key,
  });

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
