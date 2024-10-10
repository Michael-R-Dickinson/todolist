import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/theme/colors.dart';

class TodayHeadline extends StatelessWidget {
  const TodayHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "Today",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(width: 8),
        Text(
          DateFormat('dd/MM/yyyy').format(DateTime.now()),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: textLight,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
