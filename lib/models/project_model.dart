class Project {
  final String name;
  final String description;
  final String imageUrl;
  final String githubUrl;

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
  });
}

List<Project> projects = [];