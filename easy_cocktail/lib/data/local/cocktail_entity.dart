import 'package:easy_cocktail/domain/models/cocktail.dart';

class CocktailEntity {
  final String id;
  final String name;
  final String posterPath;

  const CocktailEntity({
    required this.id,
    required this.name,
    required this.posterPath,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'poster_path': posterPath};
  }

  factory CocktailEntity.fromMap(Map<String, dynamic> map) {
    return CocktailEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      posterPath: map['poster_path'] as String,
    );
  }

  factory CocktailEntity.fromDomain(Cocktail cocktail) {
    return CocktailEntity(
      id: cocktail.id,
      name: cocktail.name,
      posterPath: cocktail.posterPath,
    );
  }
}
