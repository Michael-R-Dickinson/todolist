import 'package:riverpod/riverpod.dart';
import 'package:todolist/schemas/task.dart';

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
