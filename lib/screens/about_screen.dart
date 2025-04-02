import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      drawer: const AppDrawer(),
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://media.licdn.com/dms/image/D4E03AQG3KhpXvuuwbA/profile-displayphoto-shrink_400_400/0/1679076624196?e=1722470400&v=beta&t=oXQkJsGhJ88D0-aFj795F4HqW9N1R1gS11jW25mXDDg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => const CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hello, I\'m Magati Joel',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'I am a passionate software developer with a focus on creating innovative and user-friendly applications. '
                    'With a strong background in computer science and a keen eye for detail, I strive to deliver high-quality solutions that meet and exceed expectations. '
                    'My expertise spans various technologies, including Flutter, Dart, and web development frameworks. '
                    'I am always eager to take on new challenges, collaborate with like-minded professionals, and contribute to exciting projects that make a difference. '
                    'Outside of coding, I enjoy staying active, exploring new ideas, and continuously expanding my knowledge in the ever-evolving tech landscape.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
