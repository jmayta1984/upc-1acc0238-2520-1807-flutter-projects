import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  final DestinationService service;

  DestinationsBloc({required this.service})
    : super(DestinationsInitialState()) {
    on<GetDestinationsEvent>((event, emit) async {
      emit(DestinationsLoadingState(selectedCategory: event.category));
      try {
        List<Destination> destinations = await service.getDestinations(
          category: event.category,
        );
        emit(
          DestinationsSuccessState(
            destinations: destinations,
            selectedCategory: event.category,
          ),
        );
      } catch (e) {
        emit(
          DestinationsFailureState(
            message: e.toString(),
            selectedCategory: event.category,
          ),
        );
      }
    });

    on<GetAllDestinationsEvent>((event, emit) async {
      emit(DestinationsLoadingState(selectedCategory: state.selectedCategory));
      try {
        List<Destination> destinations = await service.getDestinations();
        emit(
          DestinationsSuccessState(
            destinations: destinations,
            selectedCategory: state.selectedCategory,
          ),
        );
      } catch (e) {
        emit(
          DestinationsFailureState(
            message: e.toString(),
            selectedCategory: state.selectedCategory,
          ),
        );
      }
    });
  }
}
