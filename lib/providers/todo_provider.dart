import 'package:riverpod/riverpod.dart';

final testingTasks = [
  Task(
    id: "asldjf",
    name: "Website for Rune.io",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas purus pellentesque sagittis ultricies. In ac tempor metus, id lacinia felis. Sed eu vehicula erat.",
  ),
  Task(
    id: "asldjfds",
    name: "Ooh Laa Laa",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  ),
  Task(
    id: "asldjfdjdfs",
    name: "Ooh Laa Laa",
  )
];

class Task {
  String id;
  String name;
  String? description;

  Task({required this.id, required this.name, this.description});

  // ! Investigate a dataclass or smthn
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

// Todo List Provider
final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
    (ref) => TaskListNotifier());

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super(testingTasks);

  addTodo(Task todo) {
    state = [...state, todo];
  }
}

// Todo Single Provider
// Fetch a Todo? by its id String
final taskProvider = Provider.family<Task?, String>((ref, id) {
  final todos = ref.watch(taskListProvider);
  return todos.firstWhere((todo) => todo.id == id);
});
