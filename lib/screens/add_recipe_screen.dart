import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});
  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();
  final image = TextEditingController();
  final category = TextEditingController(text: 'Home-made');
  final minutes = TextEditingController(text: '30');
  final ingredients = TextEditingController();
  final steps = TextEditingController();
  bool saving = false;

  @override
  void dispose() {
    for (final c in [title, description, image, category, minutes, ingredients, steps]) {
      c.dispose();
    }
    super.dispose();
  }

  String? requiredText(String? value, String label) =>
      value == null || value.trim().isEmpty ? '$label is required' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add your recipe')),
      body: Form(key: formKey, child: ListView(padding: const EdgeInsets.all(16), children: [
        TextFormField(controller: title, maxLength: 100,
          decoration: const InputDecoration(labelText: 'Recipe name'),
          validator: (v) => requiredText(v, 'Recipe name')),
        const SizedBox(height: 12),
        TextFormField(controller: category, decoration: const InputDecoration(labelText: 'Category'),
          validator: (v) => requiredText(v, 'Category')),
        const SizedBox(height: 12),
        TextFormField(controller: minutes, keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Cooking time (minutes)'),
          validator: (v) {
            final n = int.tryParse(v ?? '');
            if (n == null || n < 1 || n > 1440) return 'Enter a time from 1 to 1440 minutes';
            return null;
          }),
        const SizedBox(height: 12),
        TextFormField(controller: ingredients, minLines: 3, maxLines: 6,
          decoration: const InputDecoration(labelText: 'Ingredients (one per line)'),
          validator: (v) => requiredText(v, 'Ingredients')),
        const SizedBox(height: 12),
        TextFormField(controller: steps, minLines: 3, maxLines: 8,
          decoration: const InputDecoration(labelText: 'Cooking instructions (one step per line)'),
          validator: (v) => requiredText(v, 'Instructions')),
        const SizedBox(height: 12),
        TextFormField(controller: description, maxLines: 3,
          decoration: const InputDecoration(labelText: 'Short description (optional)')),
        const SizedBox(height: 12),
        TextFormField(controller: image, decoration: const InputDecoration(labelText: 'Image URL (optional)')),
        const SizedBox(height: 20),
        FilledButton.icon(onPressed: saving ? null : _save,
          icon: saving ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.save),
          label: Text(saving ? 'Saving...' : 'Save recipe')),
      ])),
    );
  }

  Future<void> _save() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => saving = true);
    final recipe = Recipe(
      title: title.text, description: description.text, imageUrl: image.text,
      category: category.text, cookingMinutes: int.parse(minutes.text),
      ingredients: ingredients.text.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
      instructions: steps.text.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
      isPersonal: true,
    );
    await context.read<RecipeProvider>().addRecipe(recipe);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Recipe saved on this device.')));
    Navigator.pop(context);
  }
}
