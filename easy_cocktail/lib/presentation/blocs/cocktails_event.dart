import 'package:easy_cocktail/domain/models/cocktail.dart';

abstract class CocktailsEvent {
  const CocktailsEvent();
}

class GetAllCocktails extends CocktailsEvent {
  const GetAllCocktails();
}

class QueryChanged extends CocktailsEvent {
  final String query;
  const QueryChanged({required this.query});
}

class ToggleFavoriteCocktail extends CocktailsEvent {
  final Cocktail cocktail;
  const ToggleFavoriteCocktail({required this.cocktail});
}