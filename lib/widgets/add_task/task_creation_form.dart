import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todolist/widgets/add_task/create_task_dates.dart';
import 'package:todolist/widgets/add_task/task_details_input.dart';

class TaskCreationForm extends HookWidget {
  TaskCreationForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("New Task", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          TaskDetailsInput(label: "Task Name", onChange: (v) {}),
          const SizedBox(height: 18),
          TaskDetailsInput(label: "Description", onChange: (v) {}),
          const SizedBox(height: 18),
          const SizedBox(
            height: 50,
            child: CreateTaskDates(),
          ),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
