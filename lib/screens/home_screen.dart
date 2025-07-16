import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart'; // Assuming AppDrawer is correctly set up

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


// Helper method to launch URLs and handle errors
  Future<void> _launchUrl(BuildContext context, String urlString,
      {String linkType = 'link'}) async {
    // Use a more descriptive default for linkType if not provided
    Uri? uri; // Declare Uri as nullable to handle parsing failure

    // 1. Try to parse the URL string
    try {
      uri = Uri.parse(urlString);
    } catch (e) {
      // Handle FormatException if urlString is malformed
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Error: The $linkType address is not valid. Please check and try again.'),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .error,
          ),
        );
      } else {
        print("Error parsing URL (widget not mounted): '$urlString' - $e");
      }
      return; // Stop execution if parsing fails
    }

    // 2. Try to launch the parsed URI
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Specific feedback when no app can handle the URL
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Error: Could not find an application to open this $linkType. Please ensure you have a suitable app installed (e.g., a web browser for web links, an email client for mail links).'),
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .error,
            ),
          );
        } else {
          print(
              "Cannot launch URL (widget not mounted): No application can handle '$uri'");
        }
      }
    } catch (e) {
      // Catch any other exceptions during launchUrl
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Error: An unexpected problem occurred while trying to open the $linkType. ${e
                    .toString()}'),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .error,
          ),
        );
      } else {
        print("Error launching URL (widget not mounted): '$uri' - $e");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final textTheme = Theme
        .of(context)
        .textTheme;
    const String profileImageUrl = 'assets/images/profile.jpg'; // Centralize asset path
    const String userName = 'Magati Joel';
    const String userDescription = 'Freelance FullStack Developer & UI/UX Enthusiast';
    const String githubUrl = 'https://github.com/Magatijoel9620';
    const String linkedinUrl = 'https://www.linkedin.com/in/magati-joel-76a084222/'; // Corrected placeholder
    const String emailAddress = 'mailto:magatijoel@gmail.com';

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: colorScheme.surfaceContainerHighest,
        elevation: 1,
        foregroundColor: colorScheme.onSurfaceVariant,
      ),
      drawer: const AppDrawer(),
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView( // Added for potential content overflow
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.primary, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    // Fallback color
                    backgroundImage: const AssetImage(profileImageUrl),
                    onBackgroundImageError: (exception, stackTrace) {
                      // Optionally handle image loading errors, e.g., show a placeholder icon
                      // For now, it will just show the backgroundColor
                      debugPrint('Error loading profile image: $exception');
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  userName,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  userDescription,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Divider(
                  color: colorScheme.outlineVariant.withOpacity(0.5),
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),
                const SizedBox(height: 20),
                Text(
                  "Connect with me",
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                Wrap(
                  alignment: WrapAlignment.center, // Keeps items centered in the line
                  spacing: 12.0, // Horizontal space between buttons
                  runSpacing: 8.0,  // Vertical space if it wraps to a new line
                  children: [
                    _buildSocialButton(
                      context: context,
                      icon: FontAwesomeIcons.github,
                      label: 'GitHub',
                      url: githubUrl,
                      color: colorScheme.onSurface,
                    ),
                    _buildSocialButton(
                      context: context,
                      icon: FontAwesomeIcons.linkedin,
                      label: 'LinkedIn',
                      url: linkedinUrl,
                      color: const Color(0xFF0A66C2),
                    ),
                    _buildSocialButton(
                      context: context,
                      icon: Icons.email_outlined,
                      label: 'Email',
                      url: emailAddress,
                      color: Colors.teal,
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                // More space at the bottom
                // You could add more sections here, like "My Projects", "Skills", etc.
                // Example:
                // ElevatedButton(
                //   onPressed: () { /* Navigate to a projects page */ },
                //   child: Text("View My Work"),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: colorScheme.primary,
                //     foregroundColor: colorScheme.onPrimary,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required BuildContext context, // To access theme, etc.
    required IconData icon,
    required String label,
    required String url,
    required Color color, // Color for the icon and potentially text/border
    Color? iconColor, // Optional: specific color for the icon if different from 'color'
  }) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    final colorScheme = Theme
        .of(context)
        .colorScheme;

    return OutlinedButton.icon(
      icon: Icon(icon, color: iconColor ?? color, size: 20),
      // Use provided icon color or the main color
      label: Text(
        label,
        style: textTheme.labelLarge?.copyWith(
          color: color, // Use the provided color for the text
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () => _launchUrl(context, url, linkType: label),
      // Assuming _launchUrl is available
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        // Affects icon and text color if not overridden
        side: BorderSide(color: color.withOpacity(0.5), width: 1.5),
        // Border color
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        // visualDensity: VisualDensity.compact, // If you want them a bit smaller
      ),
    );
  }
}