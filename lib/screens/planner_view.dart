import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/project_provider.dart';
import 'package:todolist/theme/colors.dart';
import 'package:todolist/widgets/project_tasks_list.dart';

class PlannerView extends ConsumerWidget {
  const PlannerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectListNotifierProvider);
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
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectTasksList(project: projects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
