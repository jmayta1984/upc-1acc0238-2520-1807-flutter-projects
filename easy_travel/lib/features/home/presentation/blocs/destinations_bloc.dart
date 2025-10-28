import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  DestinationsBloc() : super(DestinationsInitialState()) {
    on<GetDestinationsEvent>((event, emit) async {
      emit(DestinationsLoadingState());

      List<Destination> destinations = await DestinationService().getDestinations(event.category);

      emit(DestinationsSuccessState(destinations: destinations));
    });
  }
}
