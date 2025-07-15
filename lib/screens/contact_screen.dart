import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart'; // Assuming this path is correct
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// For brand icons, you might consider packages like `font_awesome_flutter`
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Helper method to create styled contact list tiles
  Widget _buildContactTile({
    required BuildContext context,
    required IconData icon,
    // Widget? leadingIcon, // Alternative if you want to use custom icon widgets
    required String title,
    required String subtitle,
    required String url,
    String? scheme, // 'mailto', 'tel', or defaults to 'https'
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary, size: 28),
        // leading: leadingIcon ?? Icon(icon, color: colorScheme.primary, size: 28),
        title: Text(title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text(
          subtitle,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: colorScheme.outline),
        onTap: () async {
          final Uri launchUri = Uri(
            scheme: scheme ?? 'https', // Default to https if scheme is null
            path: url,
          );
          try {
            if (await canLaunchUrl(launchUri)) {
              await launchUrl(launchUri, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $url';
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: Could not open $title. Please try again.'),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Get In Touch'),
        // elevation: 2.0, // Optional: Add elevation if your theme doesn't
      ),
      drawer: const AppDrawer(),
      backgroundColor: colorScheme.surface, // Use theme background
      body: SafeArea(
        child: SingleChildScrollView( // Ensures content is scrollable if it overflows
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Make cards take full width
            children: [
              Text(
                'Contact Me',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Feel free to reach out through any of the channels below.',
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 30),

              _buildContactTile(
                context: context,
                icon: Icons.email_outlined,
                title: 'Email',
                subtitle: 'magatijoel@gmail.com',
                url: 'magatijoel@gmail.com', // For mailto, path is the email
                scheme: 'mailto',
              ),
              _buildContactTile(
                context: context,
                icon: Icons.phone_outlined,
                title: 'Phone',
                subtitle: '+254 (711) 879-129',
                url: '+254711879129', // For tel, path is the number
                scheme: 'tel',
              ),
              _buildContactTile(
                context: context,
                // Consider FontAwesomeIcons.linkedin for brand icon
                icon: FontAwesomeIcons.linkedin, // Placeholder, ideally a LinkedIn icon
                title: 'LinkedIn',
                subtitle: 'linkedin.com/in/magati-joel',
                url: 'linkedin.com/in/magati-joel',
              ),
              _buildContactTile(
                context: context,
                // Consider FontAwesomeIcons.github for brand icon
                icon: Icons.code_outlined, // More relevant than generic link
                title: 'GitHub',
                subtitle: 'github.com/Magatijoel9620',
                url: 'github.com/Magatijoel9620', // Corrected GitHub URL
              ),
              _buildContactTile(
                context: context,
                icon: Icons.language_outlined, // More specific than Icons.web
                title: 'Website',
                subtitle: 'hempongroup.co.ke',
                url: 'hempongroup.co.ke',
              ),

              // You could add a small map widget here if you have a physical location
              // Or a contact form if applicable.
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
