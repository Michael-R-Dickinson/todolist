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

  bool todayTask;

  bool completed;

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
    this.todayTask = false,
    this.completed = false,
  });

  Task copyWith({
    String? id,
    String? name,
    String? description,
    int? storyPoints,
    DateTime? dueDate,
    DateTime? doDate,
    bool? emergency,
    bool? locational,
    String? projectId,
    TaskTimeData? timeLog,
    double? fracIndexOrder,
    bool? todayTask,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      storyPoints: storyPoints ?? this.storyPoints,
      dueDate: dueDate ?? this.dueDate,
      doDate: doDate ?? this.doDate,
      emergency: emergency ?? this.emergency,
      locational: locational ?? this.locational,
      projectId: projectId ?? this.projectId,
      timeLog: timeLog ?? this.timeLog,
      fracIndexOrder: fracIndexOrder ?? this.fracIndexOrder,
      todayTask: todayTask ?? this.todayTask,
      completed: completed ?? this.completed,
    );
  }
}
