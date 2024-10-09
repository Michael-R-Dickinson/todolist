import 'package:flutter/material.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/utils.dart';

class TaskText extends StatelessWidget {
  final String title;
  final String? description;
  final String? projectName;
  final bool useLongerProjectGap;

  const TaskText({
    super.key,
    required this.title,
    this.description,
    this.projectName,
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
                  underlineColor: Colors.green,
                  style: titleTextStyle,
                ),
              SizedBox(width: projectName != null ? projectGap : 0),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToLastDescent: false),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (description != null)
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textLight,
                  ),
            )
        ]);
  }
}
