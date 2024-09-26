import 'package:flutter/material.dart';

class TaskText extends StatelessWidget {
  final String title;
  final String description;

  const TaskText({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
