import 'package:easy_travel/shared/domain/destination.dart';

abstract class DestinationRepository {
  Future<List<Destination>> getDestinations({required String category});

  Future<Destination> getDestinationById({required int id});
  
  Future<void> toggleFavorite(Destination destination);
}
