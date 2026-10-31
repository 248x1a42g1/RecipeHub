import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<RecipeProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe details'), actions: [
        IconButton(onPressed: () => store.toggleFavourite(recipe),
          icon: Icon(store.isFavourite(recipe) ? Icons.favorite : Icons.favorite_border,
            color: store.isFavourite(recipe) ? Colors.red : null))
      ]),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        ClipRRect(borderRadius: BorderRadius.circular(16), child: AspectRatio(aspectRatio: 16/9,
          child: recipe.imageUrl.isEmpty ? Container(color: Colors.green.shade50,
            child: const Icon(Icons.restaurant, size: 64, color: Colors.green))
          : Image.network(recipe.imageUrl, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.restaurant, size: 64)))),
        const SizedBox(height: 16),
        Text(recipe.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('${recipe.category} • ${recipe.cookingMinutes} minutes'),
        if (recipe.description.isNotEmpty) ...[const SizedBox(height: 12), Text(recipe.description)],
        const SizedBox(height: 20),
        Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        if (recipe.ingredients.isEmpty) const Text('Ingredients not provided.')
        else ...recipe.ingredients.map((item) => CheckboxListTile(
          value: false, onChanged: (_) {}, controlAffinity: ListTileControlAffinity.leading,
          title: Text(item), contentPadding: EdgeInsets.zero)),
        const SizedBox(height: 16),
        Text('Cooking steps', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        if (recipe.instructions.isEmpty) const Text('No steps provided.')
        else ...recipe.instructions.asMap().entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(radius: 14, child: Text('${entry.key + 1}')),
            const SizedBox(width: 10), Expanded(child: Text(entry.value)),
          ]))),
      ]),
    );
  }
}
