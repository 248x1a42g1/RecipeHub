
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About RecipeHub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFF2E7D32),
              child: Icon(
                Icons.restaurant_menu,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'RecipeHub',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Discover • Cook • Enjoy',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'About Our App',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'RecipeHub is a recipe discovery application '
                  'that helps users explore delicious recipes, '
                  'view cooking instructions, save favourite '
                  'recipes and create their own recipes.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.restaurant, color: Color(0xFF2E7D32)),
              title: Text('Explore Recipes'),
              subtitle: Text('Discover different recipes.'),
            ),
            const ListTile(
              leading: Icon(Icons.favorite, color: Color(0xFF2E7D32)),
              title: Text('Save Favourites'),
              subtitle: Text('Keep your favourite recipes together.'),
            ),
            const ListTile(
              leading: Icon(Icons.add_circle, color: Color(0xFF2E7D32)),
              title: Text('Create Recipes'),
              subtitle: Text('Add your own cooking ideas.'),
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              'Developed as a B.Tech project.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
