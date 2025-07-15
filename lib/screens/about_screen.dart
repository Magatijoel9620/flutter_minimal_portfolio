import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Assuming this path is correct
import 'package:cached_network_image/cached_network_image.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const String profileImagePath = 'assets/images/profile.jpg'; // <-- REPLACE WITH YOUR IMAGE PATH

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        // Consider adding elevation or a specific style if your theme doesn't provide it
        // elevation: 2.0,
      ),
      drawer: const AppDrawer(),
      backgroundColor: colorScheme.surface, // Use theme's background color
      body: SafeArea( // Ensures content isn't obscured by notches/system UI
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0), // Increased padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Profile Image Section - NOW USING LOCAL ASSET
                CircleAvatar(
                  radius: 75,
                  backgroundColor: colorScheme.secondaryContainer,
                  child: ClipOval(
                    child: Image.asset( // Use Image.asset for local assets
                      profileImagePath, // Your defined image path
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      // Optional: Error builder for local assets too
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        print('Error loading asset image: $exception');
                        // Fallback to an icon or placeholder if the asset isn't found
                        return Icon(
                          Icons.person,
                          size: 80,
                          color: colorScheme.onSecondaryContainer,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24), // Increased spacing

                // Name Section
                Text(
                  'Hello, I\'m Magati Joel',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12), // Adjusted spacing

                // Bio Section - Consider using a Card for better visual grouping
                Card(
                  elevation: 2.0, // Subtle shadow
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: colorScheme.surfaceVariant, // Slightly different background for card
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'I am a passionate software developer with a focus on creating innovative and user-friendly applications. '
                          'With a strong background in computer science and a keen eye for detail, I strive to deliver high-quality solutions that meet and exceed expectations. '
                          'My expertise spans various technologies, including Flutter, Dart, and web development frameworks. '
                          'I am always eager to take on new challenges, collaborate with like-minded professionals, and contribute to exciting projects that make a difference. '
                          'Outside of coding, I enjoy staying active, exploring new ideas, and continuously expanding my knowledge in the ever-evolving tech landscape.',
                      textAlign: TextAlign.justify, // Justify for a block text feel
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5, // Improved line height for readability
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Optional: Add a section for skills or contact links
                // Example:
                // _buildSkillsSection(context),
                // _buildSocialMediaLinks(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Example of how you might add more sections:
// Widget _buildSkillsSection(BuildContext context) {
//   return Column(
//     children: [
//       Text(
//         'My Skills',
//         style: Theme.of(context).textTheme.titleLarge,
//       ),
//       const SizedBox(height: 10),
//       Wrap(
//         spacing: 8.0,
//         runSpacing: 4.0,
//         alignment: WrapAlignment.center,
//         children: <Widget>[
//           Chip(label: Text('Flutter')),
//           Chip(label: Text('Dart')),
//           Chip(label: Text('Firebase')),
//           Chip(label: Text('UI/UX Design')),
//         ],
//       ),
//     ],
//   );
// }

// Widget _buildSocialMediaLinks(BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       IconButton(icon: Icon(Icons.link), onPressed: () {/* LinkedIn */}),
//       IconButton(icon: Icon(Icons.code), onPressed: () {/* GitHub */}),
//     ],
//   );
// }
}
