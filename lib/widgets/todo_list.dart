import 'package:flutter/material.dart';
import 'package:todolist/widgets/task_text.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
              child: Row(
            children: [
              const TaskText(
                title: "task tile!",
                description: "desc",
              ),
              Container(),
            ],
          ))
        ],
      ),
    );
  }
}
