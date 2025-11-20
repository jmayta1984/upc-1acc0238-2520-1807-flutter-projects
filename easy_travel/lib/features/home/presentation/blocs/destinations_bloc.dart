import 'dart:async';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  final DestinationRepository repository;

  DestinationsBloc({required this.repository}) : super(DestinationsState()) {
    
    on<GetDestinationsByCategory>(_getDestinationsByCategory);

    on<ToggleFavorite>(_toggleFavorite);
  }

  FutureOr<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<DestinationsState> emit,
  ) async {
    await repository.toggleFavorite(event.destination);

    List<Destination> destinations = state.destinations.map((destination) {
      return (destination.id == event.destination.id)
          ? Destination(
              id: destination.id,
              title: destination.title,
              posterPath: destination.posterPath,
              overview: destination.overview,
              isFavorite: !destination.isFavorite,
            )
          : destination;
    }).toList();

    emit(state.copyWith(destinations: destinations));
  }

  FutureOr<void> _getDestinationsByCategory(
    GetDestinationsByCategory event,
    Emitter<DestinationsState> emit,
  ) async {
    if (state.selectedCategory == event.category &&
        state.destinations.isNotEmpty) {
      return;
    }
    emit(
      state.copyWith(selectedCategory: event.category, status: Status.loading),
    );

    try {
      List<Destination> destinations = await repository.getDestinations(
        category: event.category.label,
      );
      emit(state.copyWith(status: Status.success, destinations: destinations));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
