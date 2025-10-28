import 'package:easy_travel/features/home/domain/destination.dart';

abstract class DestinationsState {}

class DestinationsInitialState extends DestinationsState {}

class DestinationsLoadingState extends DestinationsState {}

class DestinationsSuccessState extends DestinationsState {
  List<Destination> destinations;
  DestinationsSuccessState({required this.destinations});
}

class DestinationsFailureState extends DestinationsState {
  String message;
  DestinationsFailureState({required this.message});
}
