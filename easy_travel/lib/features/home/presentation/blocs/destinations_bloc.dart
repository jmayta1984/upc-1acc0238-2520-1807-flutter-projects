import 'dart:async';
import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  final DestinationService service;

  DestinationsBloc({required this.service}) : super(DestinationsState()) {
    on<GetDestinationsByCategory>(_getDestinationsByCategory);
  }

  FutureOr<void> _getDestinationsByCategory(
    GetDestinationsByCategory event,
    Emitter<DestinationsState> emit,
  ) async {
    if (state.selectedCategory == event.category && state.destinations.isNotEmpty) {
      return;
    }
    emit(
      state.copyWith(selectedCategory: event.category, status: Status.loading),
    );

    try {
      List<Destination> destinations = await service.getDestinations(
        category: event.category.label,
      );
      emit(state.copyWith(status: Status.success, destinations: destinations));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
