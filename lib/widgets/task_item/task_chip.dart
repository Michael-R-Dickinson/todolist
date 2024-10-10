import 'package:flutter/material.dart';
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
          color: Theme.of(context).cardColor,
          // Idea for another way to make the chips stand out
          // border: Border.all(color: Colors.black38, width: 0.5),
          // boxShadow: const [
          //   BoxShadow(
          //     blurRadius: 1,
          //     color: Colors.black12,
          //     offset: Offset(1, 1),
          //   )
          // ],
        ),
        child: child,
      ),
    );
  }
}

class DateTaskChip extends StatelessWidget {
  final DateTime dueDate;
  final String? prefix;
  final Color? accentColor;
  const DateTaskChip(
      {super.key, required this.dueDate, this.prefix, this.accentColor});

  @override
  Widget build(BuildContext context) {
    return TaskChipWrapper(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(size: ICON_SIZE, Icons.calendar_month_outlined),
          Text(
            "$prefix ${formatReadableDate(dueDate)}",
            style: Theme.of(context).textTheme.bodyMedium,
          )
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
            'Some Chip',
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
