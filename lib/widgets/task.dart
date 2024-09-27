import 'package:flutter/material.dart';
import 'package:todolist/theme/custom_theme.dart';
import 'package:todolist/widgets/completion_circle.dart';
import 'package:todolist/widgets/task_text.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(2, 16, 10, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: const [basicShadow],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
          ProgressCircle(percent: 0.5),
        ],
      ),
    );
  }
}
