import 'package:easy_travel/features/favorites/data/favorite_dao.dart';
import 'package:easy_travel/features/home/data/destination_dto.dart';
import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/shared/domain/destination.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationService service;
  final FavoriteDao dao;

  const DestinationRepositoryImpl({required this.service, required this.dao});

  @override
  Future<List<Destination>> getDestinations({required String category}) async {
    List<DestinationDto> dtos = await service.getDestinations(
      category: category,
    );

    List<Destination> favorites = await dao.fetchAll();
    List<int> ids = favorites.map((favorite) => favorite.id).toList();

    return dtos
        .map(
          (dto) => Destination(
            id: dto.id,
            title: dto.title,
            posterPath: dto.posterPath,
            overview: dto.overview,
            isFavorite: ids.contains(dto.id),
          ),
        )
        .toList();
  }

  @override
  Future<void> toggleFavorite(Destination destination) async {
    final bool isFavorite = await dao.isFavorite(destination.id);
    isFavorite
        ? await dao.delete(destination.id)
        : await dao.insert(destination);
  }

  @override
  Future<Destination> getDestinationById({required int id}) async {
    final DestinationDto dto = await service.getDestinationById(id);
    List<Destination> favorites = await dao.fetchAll();
    List<int> ids = favorites.map((favorite) => favorite.id).toList();
    return Destination(
      id: dto.id,
      title: dto.title,
      posterPath: dto.posterPath,
      overview: dto.overview,
      isFavorite: ids.contains(id),
    );
  }
}
