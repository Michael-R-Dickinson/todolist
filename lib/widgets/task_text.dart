import 'dart:ui';

import 'package:flutter/material.dart';

class TaskText extends StatelessWidget {
  final String title;
  final String? description;

  const TaskText({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToLastDescent: false),
          ),
          const SizedBox(height: 4),
          if (description != null)
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium,
            )
        ]);
  }
}
