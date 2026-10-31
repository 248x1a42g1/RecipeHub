import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';

enum RecipeLoadState { loading, error, empty, data }

class RecipeProvider extends ChangeNotifier {
  final RecipeService _service = RecipeService();
  List<Recipe> _recipes = [];
  List<Recipe> _personal = [];
  Set<int> _favourites = {};
  RecipeLoadState state = RecipeLoadState.loading;
  String errorMessage = '';
  String search = '';
  String category = 'All';

  List<Recipe> get allRecipes => [..._personal, ..._recipes];
  List<Recipe> get filteredRecipes {
    return allRecipes.where((recipe) {
      final matchesSearch = recipe.title.toLowerCase().contains(search.toLowerCase());
      final matchesCategory = category == 'All' || recipe.category == category;
      return matchesSearch && matchesCategory;
    }).toList();
  }
  List<Recipe> get favourites => allRecipes.where((r) => r.id != null && _favourites.contains(r.id)).toList();

  Future<void> loadRecipes() async {
    state = RecipeLoadState.loading;
    errorMessage = '';
    notifyListeners();
    await _loadSaved();
    try {
      _recipes = await _service.fetchRecipes();
      state = allRecipes.isEmpty ? RecipeLoadState.empty : RecipeLoadState.data;
    } catch (e) {
      errorMessage = 'Unable to reach the recipe service. Check your connection and retry.';
      state = allRecipes.isEmpty ? RecipeLoadState.error : RecipeLoadState.data;
    }
    notifyListeners();
  }

  Future<void> _loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('personal_recipes');
    if (saved != null) {
      try {
        _personal = (jsonDecode(saved) as List).map((e) => Recipe.fromJson(e)).toList();
      } catch (_) { _personal = []; }
    }
    _favourites = (prefs.getStringList('favourites') ?? []).map(int.tryParse)
        .whereType<int>().toSet();
  }

  Future<void> addRecipe(Recipe recipe) async {
    final newRecipe = Recipe(
      id: DateTime.now().microsecondsSinceEpoch,
      title: recipe.title.trim(), description: recipe.description.trim(),
      imageUrl: recipe.imageUrl.trim(), category: recipe.category.trim(),
      cookingMinutes: recipe.cookingMinutes, ingredients: recipe.ingredients,
      instructions: recipe.instructions, isPersonal: true,
    );
    _personal.insert(0, newRecipe);
    state = RecipeLoadState.data;
    await _savePersonal();
    notifyListeners();
  }

  Future<void> toggleFavourite(Recipe recipe) async {
    if (recipe.id == null) return;
    if (_favourites.contains(recipe.id)) {
      _favourites.remove(recipe.id);
    } else {
      _favourites.add(recipe.id!);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favourites', _favourites.map((e) => e.toString()).toList());
    notifyListeners();
  }

  bool isFavourite(Recipe recipe) => recipe.id != null && _favourites.contains(recipe.id);

  Future<void> _savePersonal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('personal_recipes', jsonEncode(_personal.map((e) => e.toJson()).toList()));
  }

  void setSearch(String value) { search = value; notifyListeners(); }
  void setCategory(String value) { category = value; notifyListeners(); }
}
