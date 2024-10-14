import 'package:flutter/material.dart';
import 'package:todolist/widgets/add_task/add_task_modal.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    const size = 50.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.add),
        color: Theme.of(context).cardColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const AddTaskModal();
            },
            isScrollControlled: true, // This makes the sheet take up more space
          );
        },
      ),
    );
  }
}
