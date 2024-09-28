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
