import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/widgets/task.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          BaseTaskItem(
            isCompactMode: true,
          ),
          BaseTaskItem(
            isCompactMode: true,
          ),
          BaseTaskItem(
            isCompactMode: true,
          ),
          BaseTaskItem(
            isCompactMode: false,
          ),
          BaseTaskItem(
            isCompactMode: false,
          ),
          BaseTaskItem(
            isCompactMode: false,
          )
        ],
      ),
    );
  }
}
