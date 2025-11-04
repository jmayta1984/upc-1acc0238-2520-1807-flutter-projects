import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';

abstract class DestinationsEvent {}

class GetDestinationsByCategory extends DestinationsEvent {
  CategoryType category;
  GetDestinationsByCategory({required this.category});
}