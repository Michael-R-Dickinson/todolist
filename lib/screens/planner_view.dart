import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/planner_task_list.dart';

class PlannerView extends ConsumerWidget {
  const PlannerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Planner",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          const SizedBox(height: 8),
          const PlannerTaskList(),
        ],
      ),
    );
  }
}
