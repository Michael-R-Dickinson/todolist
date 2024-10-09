import 'package:riverpod/riverpod.dart';
import 'package:todolist/schemas/task.dart';
import 'package:collection/collection.dart';

final testingTasks = [
  Task(
    id: "asldjf",
    name: "Website for Rune.io",
    dueDate: DateTime.now().add(const Duration(days: 12)),
    doDate: DateTime.now(),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas purus pellentesque sagittis ultricies. In ac tempor metus, id lacinia felis. Sed eu vehicula erat.",
    projectId: '1',
  ),
  Task(
    id: "asldjfds",
    name: "Ooh Laa Laa",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    dueDate: DateTime.now(),
    projectId: '2',
  ),
  Task(
    id: "asldjfdjdfs",
    name: "Ooh Laa Laa",
    dueDate: DateTime.now().add(const Duration(days: 1)),
    projectId: '3',
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
  return todos.firstWhereOrNull((todo) => todo.id == id);
});
