import 'package:flutter/material.dart';
import 'package:todolist/theme/custom_theme.dart';
import 'package:todolist/widgets/task_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: customTheme,
        themeMode: ThemeMode.light,
        home: const Scaffold(body: TodoList()));
  }
}
