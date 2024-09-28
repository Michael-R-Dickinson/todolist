// todo: Potentially convert to dataclass w/ freeze
import 'package:todolist/schemas/task_timelog.dart';

class Task {
  String id;

  String name;
  String? description;

  int? storyPoints;

  DateTime? dueDate;
  DateTime? doDate;

  bool emergency;
  bool locational;

  String? projectId;

  TaskTimeData? timeLog;

  double? fracIndexOrder;

  Task({
    required this.id,
    required this.name,
    this.description,
    this.storyPoints,
    this.dueDate,
    this.doDate,
    this.emergency = false,
    this.locational = false,
    this.projectId,
    this.timeLog,
    this.fracIndexOrder,
  });

  Task copyWith({
    String? name,
    String? description,
  }) {
    return Task(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
