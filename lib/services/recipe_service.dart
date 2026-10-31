import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeService {
  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/recipes?limit=30'),
    ).timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw Exception('Could not load recipes (HTTP ${response.statusCode}).');
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final items = body['recipes'] as List<dynamic>? ?? [];
    return items.map((item) => Recipe.fromJson(item as Map<String, dynamic>)).toList();
  }
}
