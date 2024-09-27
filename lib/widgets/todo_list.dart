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
            padding: const EdgeInsets.fromLTRB(2, 16, 10, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TaskText(
                            title: "Website for Rune.io",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit asdf asdfa asdf"),
                      ),
                    ],
                  ),
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
