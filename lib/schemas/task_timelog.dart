class TaskTimeLog {
  DateTime startTime;
  DateTime endTime;
  Duration duration;
  TaskTimeLog({
    required this.startTime,
    required this.endTime,
    required this.duration,
  });
}

class TaskTimeData {
  Duration? estTime;
  List<TaskTimeLog> timeLog = [];
}
