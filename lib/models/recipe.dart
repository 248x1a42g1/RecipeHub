class Recipe {
  final int? id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final int cookingMinutes;
  final List<String> ingredients;
  final List<String> instructions;
  final bool isPersonal;

  const Recipe({
    this.id,
    required this.title,
    this.description = '',
    this.imageUrl = '',
    this.category = 'General',
    this.cookingMinutes = 30,
    this.ingredients = const [],
    this.instructions = const [],
    this.isPersonal = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json['id'] as int?,
    title: (json['name'] ?? json['title'] ?? 'Untitled recipe').toString(),
    description: (json['description'] ?? '').toString(),
    imageUrl: (json['image'] ?? json['imageUrl'] ?? '').toString(),
    category: (json['cuisine'] ?? json['category'] ?? 'General').toString(),
    cookingMinutes: (json['cookTimeMinutes'] ?? json['cookingMinutes'] ?? 30) is int
        ? (json['cookTimeMinutes'] ?? json['cookingMinutes'] ?? 30) as int : 30,
    ingredients: (json['ingredients'] is List)
        ? (json['ingredients'] as List).map((e) => e.toString()).toList() : const [],
    instructions: (json['instructions'] is List)
        ? (json['instructions'] as List).map((e) => e.toString()).toList() : const [],
    isPersonal: json['isPersonal'] == true,
  );

  Map<String, dynamic> toJson() => {
    'id': id, 'name': title, 'description': description, 'imageUrl': imageUrl,
    'category': category, 'cookingMinutes': cookingMinutes,
    'ingredients': ingredients, 'instructions': instructions, 'isPersonal': isPersonal,
  };
}
