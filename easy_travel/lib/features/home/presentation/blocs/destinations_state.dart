import 'package:easy_travel/features/home/domain/destination.dart';

sealed class DestinationsState {
  final String selectedCategory;
  const DestinationsState({required this.selectedCategory});
}

class DestinationsInitialState extends DestinationsState {
  const DestinationsInitialState(): super(selectedCategory: 'All');
}

class DestinationsLoadingState extends DestinationsState {
  const DestinationsLoadingState({required super.selectedCategory});
}

class DestinationsSuccessState extends DestinationsState {
  final List<Destination> destinations;
  const DestinationsSuccessState({required this.destinations, required super.selectedCategory});
}

class DestinationsFailureState extends DestinationsState {
  final String message;
  const DestinationsFailureState({required this.message, required super.selectedCategory});
}
