import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final bool favourite;
  final VoidCallback onFavourite;
  const RecipeCard({super.key, required this.recipe, required this.onTap,
    required this.favourite, required this.onFavourite});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [
          SizedBox(width: 108, height: 112, child: recipe.imageUrl.isEmpty
            ? Container(color: Colors.green.shade50, child: const Icon(Icons.restaurant, size: 42, color: Colors.green))
            : Image.network(recipe.imageUrl, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.green.shade50,
                child: const Icon(Icons.restaurant, size: 42, color: Colors.green)))),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(recipe.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(recipe.category, style: TextStyle(color: Colors.green.shade700)),
              const SizedBox(height: 6),
              Text('${recipe.cookingMinutes} min • ${recipe.ingredients.length} ingredients',
                style: Theme.of(context).textTheme.bodySmall),
            ]),
          )),
          IconButton(onPressed: onFavourite,
            icon: Icon(favourite ? Icons.favorite : Icons.favorite_border,
              color: favourite ? Colors.red : null)),
        ]),
      ),
    );
  }
}
