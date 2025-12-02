class Cocktail {
  final String id;
  final String name;
  final String category;
  final String posterPath;
  final String instructions;
  final bool isFavorite;

  const Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.posterPath,
    required this.instructions,
    required this.isFavorite,
  });

  Cocktail copyWith({
    String? id,
    String? name,
    String? category,
    String? posterPath,
    String? instructions,
    bool? isFavorite,
  }) {
    return Cocktail(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      posterPath: posterPath ?? this.posterPath,
      instructions: instructions ?? this.instructions,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
