import 'package:flutter/material.dart';
import 'package:todolist/widgets/task_item/task_text.dart';

const titlePlaceholder = "Website for Rune.io";
const descriptionPlaceholder =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit asdf asdfa asdf";

class CompactTaskItem extends StatelessWidget {
  const CompactTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskText(title: titlePlaceholder);
  }
}
