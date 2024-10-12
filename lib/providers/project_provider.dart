import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/schemas/project.dart';
import 'package:collection/collection.dart';

final testingProjects = [
  Project(
    id: '1',
    name: 'Project 1',
    description: 'Description 1',
    color: Colors.blueAccent,
  ),
  Project(
    id: '2',
    name: 'Project 2',
    description: 'Description 2',
    color: Colors.redAccent,
  ),
  Project(
    id: '3',
    name: 'Project 3',
    description: 'Description 3',
    color: Colors.greenAccent,
  ),
];

class ProjectsListNotifier extends StateNotifier<List<Project>> {
  ProjectsListNotifier() : super(testingProjects);

  void addProject(Project project) {
    state = [...state, project];
  }

  void updateProject(Project project) {
    state = [
      for (final p in state)
        if (p.id == project.id) project else p
    ];
  }

  void deleteProject(String id) {
    state = state.where((project) => project.id != id).toList();
  }
}

final projectListNotifierProvider =
    StateNotifierProvider<ProjectsListNotifier, List<Project>>(
  (ref) => ProjectsListNotifier(),
);

final projectProvider = Provider.family<Project?, String>((ref, id) {
  final projects = ref.watch(projectListNotifierProvider);
  return projects.firstWhereOrNull((project) => project.id == id);
});
