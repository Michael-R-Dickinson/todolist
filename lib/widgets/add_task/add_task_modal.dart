import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/widgets/add_task/task_creation_form.dart';

class AddTaskModal extends StatelessWidget {
  const AddTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Handles keyboard
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: taskBorderRadius,
        ),
        // color: backgroundColor,
        child: TaskCreationForm(),
      ),
    );
  }
}
