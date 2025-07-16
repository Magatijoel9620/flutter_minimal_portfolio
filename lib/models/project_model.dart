// lib/models/project_model.dart (or wherever your Project class is defined)

class Project {
  final String name;
  final String description;
  final String imageUrl;
  final bool isNetworkImage; // <<< ADDED THIS LINE
  final String? githubUrl;
  final String? liveDemoUrl;
  final List<String>? technologies; // Assuming you might have this field

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.isNetworkImage = true, // <<< ADDED THIS (default to true, adjust if needed)
    this.githubUrl,
    this.liveDemoUrl,
    this.technologies,
  });

// If you use factory constructors for JSON, you'd add it there too,
// but based on your code, you're likely constructing these objects directly.
}
