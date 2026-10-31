import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final store = context.watch<RecipeProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('RecipeHub'), actions: [
        IconButton(onPressed: store.loadRecipes, tooltip: 'Refresh', icon: const Icon(Icons.refresh))
      ]),
      body: Column(children: [
        Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
          child: TextField(decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: 'Search recipes', filled: true),
            onChanged: store.setSearch)),
        SizedBox(height: 44, child: ListView(scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: ['All', ...store.allRecipes.map((e) => e.category).toSet()].map((c) =>
            Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(label: Text(c), selected: store.category == c,
                onSelected: (_) => store.setCategory(c)))).toList())),
        Expanded(child: _content(context, store)),
      ]),
    );
  }

  Widget _content(BuildContext context, RecipeProvider store) {
    if (store.state == RecipeLoadState.loading && store.allRecipes.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (store.state == RecipeLoadState.error && store.allRecipes.isEmpty) {
      return Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(
        mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.cloud_off, size: 48), const SizedBox(height: 12),
          Text(store.errorMessage, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          FilledButton.icon(onPressed: store.loadRecipes, icon: const Icon(Icons.refresh), label: const Text('Retry')),
        ])));
    }
    final recipes = store.filteredRecipes;
    if (recipes.isEmpty) return const Center(child: Text('No recipes found. Add a recipe or change your search.'));
    return RefreshIndicator(onRefresh: store.loadRecipes,
      child: ListView.builder(padding: const EdgeInsets.all(12), itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(recipe: recipe, favourite: store.isFavourite(recipe),
            onFavourite: () => store.toggleFavourite(recipe),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => RecipeDetailScreen(recipe: recipe))),
          );
        }));
  }
}
