import 'package:flutter_test/flutter_test.dart';
import 'package:recipehub/models/recipe.dart';

void main() {
  test('Recipe model serializes and restores personal recipe', () {
    const recipe = Recipe(
      id: 10, title: 'Tomato rice', category: 'Lunch', cookingMinutes: 25,
      ingredients: ['Rice', 'Tomato'], instructions: ['Cook rice', 'Mix tomato'],
      isPersonal: true,
    );
    final restored = Recipe.fromJson(recipe.toJson());
    expect(restored.title, 'Tomato rice');
    expect(restored.ingredients.length, 2);
    expect(restored.isPersonal, isTrue);
  });
}
