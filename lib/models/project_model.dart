// project_model.dart (Example)
class Project {
  final String name;
  final String description;
  final String imageUrl;
  final String? githubUrl;
  final String? liveDemoUrl; // Added for a live demo link
  final List<String>? technologies; // Added for technology tags

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.githubUrl,
    this.liveDemoUrl,
    this.technologies,
  });
}