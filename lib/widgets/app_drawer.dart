import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final colorScheme = Theme.of(context).colorScheme; // Get color scheme for icons/text

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text(
              'My Portfolio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: const Text(
              'Magati Joel / Available.', // Or your slogan
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/icons/portfolio.png',
                 // 'assets/images/profile.jpg', // Ensure this path is correct
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 40), // Fallback
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home_outlined, // Using outline version
            text: 'Home',
            isSelected: currentRoute == '/',
            onTap: () {
              if (currentRoute != '/') {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              } else {
                Navigator.pop(context);
              }
            },
            context: context,
            colorScheme: colorScheme,
          ),
          _buildDrawerItem(
            icon: Icons.info_outline,
            text: 'About',
            isSelected: currentRoute == '/about',
            onTap: () {
              if (currentRoute != '/about') {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/about');
              } else {
                Navigator.pop(context);
              }
            },
            context: context,
            colorScheme: colorScheme,
          ),
          // --- ADD PROJECTS DRAWER ITEM HERE ---
          _buildDrawerItem(
            icon: Icons.work_outline, // Or Icons.folder_special_outlined, Icons.lightbulb_outline
            text: 'Projects',
            isSelected: currentRoute == '/projects',
            onTap: () {
              if (currentRoute != '/projects') {
                Navigator.pop(context); // Close the drawer first
                Navigator.pushReplacementNamed(context, '/projects');
              } else {
                Navigator.pop(context); // Just close if already on the page
              }
            },
            context: context,
            colorScheme: colorScheme, // Pass colorScheme
          ),
          // --- END OF PROJECTS DRAWER ITEM ---
          _buildDrawerItem(
            icon: Icons.contact_mail_outlined,
            text: 'Contact',
            isSelected: currentRoute == '/contact',
            onTap: () {
              if (currentRoute != '/contact') {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/contact');
              } else {
                Navigator.pop(context);
              }
            },
            context: context,
            colorScheme: colorScheme,
          ),
          const Divider(),
          // Optional: Add other items like Settings
        ],
      ),
    );
  }

  // Helper method to create ListTile for drawer items
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context, // Keep context if needed for Theme directly inside
    required ColorScheme colorScheme, // Pass ColorScheme for styling
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? colorScheme.secondary : colorScheme.onSurfaceVariant, // Use theme colors
      ),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? colorScheme.secondary : colorScheme.onSurface, // Use theme colors
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: colorScheme.secondaryContainer.withOpacity(0.3), // Use theme color for selection
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    );
  }
}
