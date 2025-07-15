import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/project_card.dart'; // Your ProjectCard widget
import '../models/project_model.dart';   // Your Project model

class ProjectsScreen extends StatefulWidget { // Changed to StatefulWidget for potential future state changes (e.g., fetching data)
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  // Sample project data - in a real app, this would likely be fetched from an API,
  // a local database, or a service.
  // For now, it's hardcoded for demonstration.
  final List<Project> _projects = [
    Project(
      name: 'Portfolio (Flutter)',
      description: 'The very website you are likely viewing! Built with Flutter to showcase my skills, projects, and provide contact information. Features responsive design and Material 3 theming.',
      imageUrl: 'assets/image/portfolio_project_ss.png',
      githubUrl: 'https://github.com/Magatijoel9620/flutter_minimal_portfolio.git',
      liveDemoUrl: null,
      technologies: ['Flutter', 'Dart', 'Material 3', 'Responsive Design'],
    ),
    Project(
      name: 'E-commerce Mobile App',
      description: 'A concept mobile application for an online store, featuring product listings, cart functionality, and user authentication. Focused on clean UI/UX.',
      imageUrl: 'https://via.placeholder.com/600x400.png/007BFF/FFFFFF?Text=E-commerce+App',
      githubUrl: 'https://github.com/Magatijoel9620/fooddeliveryfirebase.git',
      liveDemoUrl: null,
      technologies: ['Flutter', 'Firebase', 'State Management (Provider/Bloc)'],
    ),
    Project(
      name: 'Task Management Mobile App',
      description: 'A simple application for managing tasks and to-do lists, built with Flutter and modern UI-UX.',
      imageUrl: 'https://via.placeholder.com/600x400.png/28A745/FFFFFF?Text=Task+Manager+App',
      githubUrl: 'https://github.com/Magatijoel9620/Simple_flutter_ToDo.git',
      liveDemoUrl: null,
      technologies: ['Flutter', 'Firebase', 'State Management'],
    ),
    Project(
      name: 'StayZen Accommodation App (Design)',
      description: 'Modern accommodation booking UI with search, date selection, and immersive design. Built in Flutter with neumorphism/glassmorphism, dark/light mode, and animations.',
      imageUrl: 'https://via.placeholder.com/600x400.png/FFC107/000000?Text=StayZen+UI',
      githubUrl: 'https://github.com/Magatijoel9620/stayZen_booking.git',
      liveDemoUrl: null,
      technologies: ['Flutter', 'Material 3', 'Animations', 'Dark Mode', 'UI Design'],
    ),
    Project(
      name: 'Invoice App (Flutter)',
      description: 'An invoice manager app featuring dark/light mode, invoice entry, and a clean modern interface. Built with Flutter and Material 3.',
      imageUrl: 'https://via.placeholder.com/600x400.png/6F42C1/FFFFFF?Text=Invoice+App',
      githubUrl: 'https://github.com/Magatijoel9620/invoice_app_flutter.git',
      liveDemoUrl: null,
      technologies: ['Flutter', 'Material 3', 'Stateful Widgets', 'Dark Mode'],
    ),
    Project(
      name: 'Hempon Business Website (Next.js)',
      description: 'A clean, modern general supplies company website built with Next.js, Tailwind CSS, shadcn/ui, and Framer Motion. Includes Home, About, Services, and Contact pages with dark mode toggle.',
      imageUrl: 'https://via.placeholder.com/600x400.png/17A2B8/FFFFFF?Text=Hempon+Website',
      githubUrl: 'https://github.com/Magatijoel9620/hempon-group.git',
      liveDemoUrl: null,
      technologies: ['Next.js', 'Tailwind CSS', 'shadcn/ui', 'Framer Motion', 'Dark Mode'],
    ),
    Project(
      name: 'Client Portal for Law Firm (Django)',
      description: 'A secure Django-based client portal for a law firm, using PostgreSQL and a modern UI. Includes client document upload, dashboard, and authentication.',
      imageUrl: 'https://via.placeholder.com/600x400.png/343A40/FFFFFF?Text=Client+Portal',
      githubUrl: 'https://github.com/Magatijoel9620/law_portal.git',
      liveDemoUrl: null,
      technologies: ['Django', 'PostgreSQL', 'Bootstrap/Tailwind', 'Auth'],
    ),
    Project(
      name: 'Legal Aid Report Automation (Google Apps Script)',
      description: 'An automation script for Google Sheets and Forms to generate monthly summaries, charts, PDF reports, and dashboard views for legal aid responses.',
      imageUrl: 'https://via.placeholder.com/600x400.png/20C997/FFFFFF?Text=Legal+Aid+Automation',
      githubUrl: null,
      liveDemoUrl: null,
      technologies: ['Google Apps Script', 'Google Sheets', 'PDF Generation', 'Automation'],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        // Consider adding actions or specific styling if needed
      ),
      drawer: const AppDrawer(),
      backgroundColor: colorScheme.surfaceContainerLowest, // A slightly off-white for background
      body: _buildBody(context, textTheme, colorScheme),
    );
  }

  Widget _buildBody(BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    if (_projects.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sentiment_dissatisfied_outlined, size: 60, color: colorScheme.onSurfaceVariant),
              const SizedBox(height: 16),
              Text(
                'No Projects Yet!',
                style: textTheme.headlineSmall?.copyWith(color: colorScheme.onSurface),
              ),
              const SizedBox(height: 8),
              Text(
                'I\'m currently working on showcasing my projects here. Please check back soon!',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      );
    }

    // Using GridView for a potentially more engaging layout on wider screens,
    // but ListView is also perfectly fine.
    // For simplicity and consistency with mobile, ListView.builder is often preferred.
    // If targeting web primarily, GridView can be nice.

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0), // Padding around the list
      itemCount: _projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: _projects[index]);
      },
    );

    // --- OR --- You could use a GridView for a different layout:
    // return GridView.builder(
    //   padding: const EdgeInsets.all(16.0),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: _calculateCrossAxisCount(context), // Responsive columns
    //     crossAxisSpacing: 16.0,
    //     mainAxisSpacing: 16.0,
    //     childAspectRatio: 0.8, // Adjust as needed for card proportions
    //   ),
    //   itemCount: _projects.length,
    //   itemBuilder: (context, index) {
    //     return ProjectCard(project: _projects[index]);
    //   },
    // );
  }

// Helper for responsive GridView columns (if you choose GridView)
// int _calculateCrossAxisCount(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;
//   if (screenWidth > 1200) {
//     return 3; // Large screens
//   } else if (screenWidth > 800) {
//     return 2; // Medium screens / Tablets
//   } else {
//     return 1; // Small screens / Mobile
//   }
// }
}
