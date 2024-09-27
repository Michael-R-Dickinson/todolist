import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/utils.dart';

const double ICON_SIZE = 15;

class TaskChipWrapper extends StatelessWidget {
  final Widget child;
  const TaskChipWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38, width: 0.5),
        ),
        child: child,
      ),
    );
  }
}

class DueDateTaskChip extends StatelessWidget {
  final DateTime dueDate;
  const DueDateTaskChip({super.key, required this.dueDate});

  @override
  Widget build(BuildContext context) {
    return TaskChipWrapper(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(size: ICON_SIZE, Icons.calendar_month_outlined),
          Text(formatReadableDate(dueDate))
        ],
      ),
    );
  }
}

class IconTextTaskChip extends StatelessWidget {
  const IconTextTaskChip({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskChipWrapper(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            size: ICON_SIZE,
            Icons.favorite_outline,
            color: Colors.red,
          ),
          const SizedBox(width: 5),
          Text(
            'some chip',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black87),
          )
        ],
      ),
    );
  }
}
