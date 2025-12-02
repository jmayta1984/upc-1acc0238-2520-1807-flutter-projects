import 'package:easy_cocktail/data/local/cocktail_dao.dart';
import 'package:easy_cocktail/data/local/cocktail_entity.dart';
import 'package:easy_cocktail/data/remote/cocktail_dto.dart';
import 'package:easy_cocktail/data/remote/cocktail_service.dart';
import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/domain/repositories/cocktail_repository.dart';

class CocktailRepositoryImpl implements CocktailRepository {
  final CocktailService service;
  final CocktailDao dao;
  const CocktailRepositoryImpl({required this.service, required this.dao});
  @override
  Future<List<Cocktail>> getAllCocktails(String query) async {
    try {
      final List<CocktailDto> dtos = await service.getAllCocktails(query);
      final favoriteIds = await dao.getAllFavoriteIds();

      return dtos
          .map(
            (dto) => dto.toDomain().copyWith(
              isFavorite: favoriteIds.contains(dto.id),
            ),
          )
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> toggleFavoriteCocktail(Cocktail cocktail) async {
    if (cocktail.isFavorite) {
      await dao.delete(cocktail.id);
    } else {
      await dao.insert(CocktailEntity.fromDomain(cocktail));
    }
  }
}
