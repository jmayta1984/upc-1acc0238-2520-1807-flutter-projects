import 'package:easy_travel/shared/domain/destination.dart';

class FavoriteListState {
  final List<Destination> destinations;

  const FavoriteListState({this.destinations = const []});

  FavoriteListState copyWith({List<Destination>? destinations}) {
    return FavoriteListState(destinations: destinations ?? this.destinations);
  }
}
