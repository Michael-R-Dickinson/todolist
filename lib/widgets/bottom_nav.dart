import 'package:flutter/material.dart';
import 'package:todolist/widgets/add_task_button.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black87,
            width: 2,
          ),
        ),
      ),
      child: BottomAppBar(
        color: Theme.of(context).cardColor,
        height: 65,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.subject_outlined),
              onPressed: () {},
            ),
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.calendar_month_outlined),
              onPressed: () {},
            ),
            const AddTaskButton(),
            IconButton(
              icon: const Icon(Icons.task_outlined),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline_outlined),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
