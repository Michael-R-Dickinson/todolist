import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/screens/today_view.dart';
import 'package:todolist/theme/custom_theme.dart';

import 'screens/planner_view.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/planner', builder: (context, state) => const PlannerView()),
  GoRoute(path: '/', builder: (context, state) => const TodayView()),
]);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: customTheme,
      themeMode: ThemeMode.light,
      routerConfig: _router,
    );
  }
}
