import 'package:easy_travel/core/enums/category_type.dart';
import 'package:easy_travel/shared/domain/destination.dart';

abstract class DestinationsEvent {
  const DestinationsEvent();
}

class GetDestinationsByCategory extends DestinationsEvent {
  final CategoryType category;
  const GetDestinationsByCategory({required this.category});
}

class ToggleFavorite extends DestinationsEvent {
  final Destination destination;
  const ToggleFavorite({required this.destination});
}