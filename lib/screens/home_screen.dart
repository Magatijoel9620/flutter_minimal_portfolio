import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart'; // Assuming AppDrawer is correctly set up

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Helper method to launch URLs and handle errors
  Future<void> _launchUrl(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication); // Open in external app
      } else {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Could not open link. ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
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
                    backgroundColor: colorScheme.surfaceContainerHighest, // Fallback color
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      context: context,
                      icon: Icons.code_rounded, // Using a more specific Material icon
                      label: 'GitHub',
                      url: githubUrl,
                      color: colorScheme.onSurface, // Or a specific brand color
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      context: context,
                      // You might need a custom icon for LinkedIn or use FontAwesome
                      icon: Icons.business_center_outlined, // Placeholder for LinkedIn
                      label: 'LinkedIn',
                      url: linkedinUrl,
                      color: const Color(0xFF0A66C2), // LinkedIn blue
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      context: context,
                      icon: Icons.email_outlined,
                      label: 'Email',
                      url: emailAddress,
                      color: Colors.redAccent, // Example color
                    ),
                  ],
                ),
                const SizedBox(height: 40), // More space at the bottom
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

  // Helper widget for social media buttons
  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String url,
    Color? color,
  }) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
    return Tooltip(
      message: label,
      child: InkWell( // Using InkWell for better tap feedback and custom shape
        onTap: () => _launchUrl(context, url),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 28, color: effectiveColor),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(fontSize: 10, color: effectiveColor, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
