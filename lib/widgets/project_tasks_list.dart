import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/schemas/project.dart';
import 'package:todolist/utils.dart';
import 'package:todolist/widgets/planner_task.dart';

class ProjectTasksList extends ConsumerWidget {
  final Project project;

  const ProjectTasksList({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksForProjectProvider(project.id));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailedUnderlinedText(
          text: project.name,
          style: Theme.of(context).textTheme.headlineSmall,
          underlineOffset: -5,
          underlineThickness: 2,
          underlineColor: project.color,
        ),
        ...tasks.map((task) => Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: PlannerTask(id: task.id),
            )),
      ],
    );
  }
}
