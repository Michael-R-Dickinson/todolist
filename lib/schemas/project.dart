import 'package:flutter/material.dart';

class Project {
  final String id;
  final String name;
  final String description;
  final Color color;

  Project({
    required this.id,
    required this.name,
    required this.description,
    this.color = Colors.blueAccent,
  });

  copyWith({
    String? name,
    String? description,
  }) {
    return Project(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color,
    );
  }
}
