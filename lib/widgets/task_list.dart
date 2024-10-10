import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/view_settings_provider.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/widgets/task_item/base_task.dart';
import 'package:todolist/widgets/today_headline.dart';
import 'package:todolist/widgets/today_progress_bars.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const TodayHeadline(),
          const SizedBox(height: 2),
          const TodayProgressBars(
            singleBar: false,
          ),
          const SizedBox(height: 5),
          // const TodayTasktypeSwitcher(),
          const SizedBox(height: 5),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BaseTaskItem(
                    id: tasks[index].id,
                  );
                },
                itemCount: tasks.length,
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(viewSettingsProvider.notifier).toggleCompactMode();
                },
                child: const Text('PRESS ME'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
