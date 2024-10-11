import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/utils.dart';

class TaskText extends StatelessWidget {
  final String title;
  final String? description;
  final String? projectName;
  final Color? projectAccentColor;
  final bool useLongerProjectGap;

  const TaskText({
    super.key,
    required this.title,
    this.description,
    this.projectName,
    this.projectAccentColor,
    this.useLongerProjectGap = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.titleMedium;
    final double projectGap = useLongerProjectGap ? 8 : 4;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              if (projectName != null)
                DetailedUnderlinedText(
                  text: projectName!,
                  underlineOffset: -4,
                  underlineColor: projectAccentColor?.withAlpha(150),
                  style: titleTextStyle,
                ),
              SizedBox(width: projectName != null ? projectGap : 0),
              TaskTitleText(title: title),
            ],
          ),
          const SizedBox(height: 4),
          if (description != null)
            TaskDescriptionText(description: description!)
        ]);
  }
}

class TaskDescriptionText extends StatelessWidget {
  const TaskDescriptionText(
      {super.key, required this.description, this.truncateToOneLine = false});

  final String description;
  final bool truncateToOneLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      overflow: truncateToOneLine ? TextOverflow.ellipsis : null,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textLight,
          ),
    );
  }
}

class TaskTitleText extends StatelessWidget {
  const TaskTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
      textHeightBehavior:
          const TextHeightBehavior(applyHeightToLastDescent: false),
    );
  }
}
