import 'package:flutter/material.dart';
import 'package:todolist/screens/planner_view.dart';
import 'package:todolist/screens/today_view.dart';
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
        padding: const EdgeInsets.all(8),
        height: 65,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.subject_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlannerView(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.task_outlined),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TodayView(),
                  ),
                );
              },
            ),
            const AddTaskButton(),
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.calendar_month_outlined),
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
