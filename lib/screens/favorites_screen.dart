import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final store = context.watch<RecipeProvider>();
    final recipes = store.favourites;
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: recipes.isEmpty
        ? const Center(child: Padding(padding: EdgeInsets.all(24),
            child: Text('No favourites yet. Tap the heart on a recipe to save it.', textAlign: TextAlign.center)))
        : ListView.builder(padding: const EdgeInsets.all(12), itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return RecipeCard(recipe: recipe, favourite: true,
                onFavourite: () => store.toggleFavourite(recipe),
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (_) => RecipeDetailScreen(recipe: recipe))));
            }),
    );
  }
}
