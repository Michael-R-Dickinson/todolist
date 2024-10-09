class Project {
  final String name;
  final String description;

  Project({
    required this.name,
    required this.description,
  });

  copyWith({
    String? name,
    String? description,
  }) {
    return Project(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
