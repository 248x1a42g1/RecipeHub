
import 'package:flutter/material.dart';
import 'about_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Color(0xFF2E7D32),
            child: Icon(
              Icons.person,
              size: 65,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Recipe Explorer',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Welcome to RecipeHub!',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.restaurant_menu,
                color: Color(0xFF2E7D32),
              ),
              title: const Text('My Recipes'),
              subtitle: const Text('Explore your cooking journey'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Color(0xFF2E7D32),
              ),
              title: const Text('About RecipeHub'),
              subtitle: const Text('Learn more about our application'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AboutScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
