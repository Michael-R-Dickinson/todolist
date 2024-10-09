import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/task_item/task_text.dart';

class CompactTaskItem extends ConsumerWidget {
  final String id;
  const CompactTaskItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ! Investigate using select
    final todo = ref.watch(taskProvider(id));

    if (todo == null) return const SizedBox.shrink();

    return Row(children: [
      TaskText(
        title: todo.name.toString(),
        projectName: "CPSC 110",
        useLongerProjectGap: true,
      ),
    ]);
  }
}
