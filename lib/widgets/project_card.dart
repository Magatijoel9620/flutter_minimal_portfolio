import 'package:flutter/material.dart';
import '../models/project_model.dart'; // Ensure this path is correct
import 'package:url_launcher/url_launcher.dart';
// If you want better image handling with caching and placeholders:
// import 'package:cached_network_image/cached_network_image.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  // Using the more robust _launchURL method
  Future<void> _launchURL(BuildContext context, String? urlString, String linkType) async {
    if (urlString == null || urlString.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$linkType link is not available.'),
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        );
      }
      return;
    }

    Uri? uri;
    try {
      uri = Uri.parse(urlString);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: The $linkType address is not valid: $urlString'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
      return;
    }

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // This is the message you were seeing for the .git URL
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: Could not find an application to open the $linkType: $uri'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
        // For debugging, you can still print or log the error
        print("Could not launch $uri (canLaunchUrl returned false)");
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: An unexpected problem occurred with the $linkType. ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
      print("Error launching $uri: $e");
    }
  }

  Widget _buildProjectImage() {
    // if (project.isNetworkImage) {
    //   // Use Image.network or CachedNetworkImage
    // // Using Image.network as per your current code.
    // // Consider CachedNetworkImage for better UX (caching, placeholders).
    // return ClipRRect(
    //   borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
    //   child: Image.network(
    //     project.imageUrl, // Assuming project.imageUrl is always a valid, non-empty string
    //     fit: BoxFit.cover,
    //     height: 180, // Matched height with previous CachedNetworkImage example
    //     width: double.infinity,
    //     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    //       if (loadingProgress == null) return child;
    //       return Container( // Placeholder while loading
    //         height: 180,
    //         width: double.infinity,
    //         color: Colors.grey[300],
    //         child: Center(
    //           child: CircularProgressIndicator(
    //             value: loadingProgress.expectedTotalBytes != null
    //                 ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
    //                 : null,
    //           ),
    //         ),
    //       );
    //     },
    //     errorBuilder: (context, error, stackTrace) {
    //       print("Error loading image ${project.imageUrl}: $error"); // For debugging
    //       return Container( // Improved error widget
    //         height: 180,
    //         width: double.infinity,
    //         color: Colors.grey[200],
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(Icons.broken_image_outlined, color: Colors.grey[600], size: 48),
    //             const SizedBox(height: 8),
    //             Text('Image not available', style: TextStyle(color: Colors.grey[600])),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
    // } else {
      // Use Image.asset for local assets
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
        child: Image.asset(
          project.imageUrl, // This is now the asset path, e.g., "assets/icons/portfolio.png"
          fit: BoxFit.cover,
          height: 180,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            print("Error loading asset image ${project.imageUrl}: $error");
            return Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_not_supported_outlined, color: Colors.grey[600], size: 48),
                  const SizedBox(height: 8),
                  Text('Asset not found', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            );
          },
        ),
      );
    }

  //}


  Widget _buildTechnologyTags(BuildContext context) {
    if (project.technologies == null || project.technologies!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Wrap(
        spacing: 6.0,
        runSpacing: 4.0,
        children: project.technologies!
            .map((tech) => Chip(
          label: Text(tech),
          labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        ))
            .toList(),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    // This structure is from one of your earlier ProjectCard versions and is good.
    // It handles visibility of buttons based on URL availability.
    bool hasLiveDemo = project.liveDemoUrl != null && project.liveDemoUrl!.isNotEmpty;
    bool hasGithub = project.githubUrl != null && project.githubUrl!.isNotEmpty;

    if (!hasLiveDemo && !hasGithub) {
      return const SizedBox.shrink(); // No buttons to show
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          if (hasLiveDemo)
            TextButton.icon(
              icon: const Icon(Icons.visibility_outlined, size: 18),
              label: const Text('Live Demo'),
              onPressed: () => _launchURL(context, project.liveDemoUrl, 'Live Demo'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          if (hasLiveDemo && hasGithub)
            const SizedBox(width: 8), // Spacer
          if (hasGithub)
            ElevatedButton.icon(
              icon: const Icon(Icons.code_outlined, size: 18),
              label: const Text('GitHub'),
              onPressed: () => _launchURL(context, project.githubUrl, 'GitHub'), // CORRECTED
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProjectImage(), // Using the helper method
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  project.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                _buildTechnologyTags(context),
                _buildActionButtons(context), // Using the helper method
              ],
            ),
          ),
        ],
      ),
    );
  }
}
