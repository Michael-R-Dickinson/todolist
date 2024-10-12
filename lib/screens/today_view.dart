import 'package:flutter/material.dart';
import 'package:todolist/widgets/task_list.dart';
import 'package:todolist/widgets/bottom_nav.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TodoList(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
