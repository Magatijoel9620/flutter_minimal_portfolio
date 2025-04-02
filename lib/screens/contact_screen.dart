import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Contact Me',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Feel free to reach me out',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: const Text('joelmagati4@gmail.com'),
                      onTap: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'magatijoel@gmail.com',
                        );
                        if (await canLaunchUrl(emailLaunchUri)) {
                          launchUrl(emailLaunchUri);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not launch email.'),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Phone'),
                      subtitle: const Text('+254 (711) 879-129'),
                      onTap: () async {
                        final Uri phoneLaunchUri = Uri(
                          scheme: 'tel',
                          path: '+254797867607',
                        );
                        if (await canLaunchUrl(phoneLaunchUri)) {
                          launchUrl(phoneLaunchUri);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not launch phone.'),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.link),
                      title: const Text('LinkedIn'),
                      subtitle: const Text('linkedin.com/in/magati-joel'),
                      onTap: () async {
                        final Uri linkedinLaunchUri = Uri(
                          scheme: 'https',
                          path: 'linkedin.com/in/magati-joel',
                        );
                        if (await canLaunchUrl(linkedinLaunchUri)) {
                          launchUrl(linkedinLaunchUri);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not launch LinkedIn.'),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.link),
                      title: const Text('GitHub'),
                      subtitle: const Text('github.com/Magati-joel'),
                      onTap: () async {
                        final Uri githubLaunchUri = Uri(
                          scheme: 'https',
                          path: 'github.com/Magatijoel9620',
                        );
                        if (await canLaunchUrl(githubLaunchUri)) {
                          launchUrl(githubLaunchUri);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not launch GitHub.'),
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.web),
                      title: const Text('Website'),
                      subtitle: const Text('hempongroup.co.ke'),
                      onTap: () async {
                        final Uri websiteLaunchUri = Uri(
                          scheme: 'https',
                          path: 'hempongroup.co.ke',
                        );
                        if (await canLaunchUrl(websiteLaunchUri)) {
                          launchUrl(websiteLaunchUri);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not launch website.'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
