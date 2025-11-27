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
