import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/widgets/complete_checkbox.dart';
import 'package:todolist/widgets/task_text.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Row(children: [
                    CompleteCheckbox(),
                    SizedBox(
                      width: 15,
                    ),
                    TaskText(
                      title: "task tile!",
                      description: "desc",
                    ),
                  ]),
                ),
                Container(
                  child: const Text('progress'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
