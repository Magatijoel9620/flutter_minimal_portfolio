import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/160x160'), // Replace with your profile picture URL
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Name', // Replace with your name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your Description Here', // Replace with your description
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.code), // GitHub icon
                    onPressed: () async {
                      final url = Uri.parse('https://github.com/yourusername'); // Replace with your GitHub URL
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.link), // LinkedIn icon
                    onPressed: () async {
                      final url = Uri.parse('https://www.linkedin.com/in/yourprofile/'); // Replace with your LinkedIn URL
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.email),
                    onPressed: () async {
                      final url = Uri.parse('mailto:youremail@example.com'); // Replace with your email
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}