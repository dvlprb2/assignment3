import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current time
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    // Determine the greeting based on the current time
    String greeting = '';
    if (currentHour < 12) {
      greeting = 'Good Morning';
    } else if (currentHour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Display the header image
          Image.network(
            'https://images.pexels.com/photos/16143559/pexels-photo-16143559/free-photo-of-landscape-of-rocky-snowcapped-mountains.jpeg',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),

          // Display the greeting message
          Text(
            greeting,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/calculator'),
            child: const Text('Calculator'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/todo'),
            child: const Text('Todo'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/weather'),
            child: const Text('Weather'),
          ),
        ],
      ),
    );
  }
}
