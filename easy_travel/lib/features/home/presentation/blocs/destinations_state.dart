import 'package:easy_travel/core/enums/category_type.dart';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/shared/domain/destination.dart';

class DestinationsState {
  final Status status;
  final CategoryType selectedCategory;
  final List<Destination> destinations;
  final String? message;

  const DestinationsState({
    this.status = Status.initial,
    this.selectedCategory = CategoryType.all,
    this.destinations = const [],
    this.message,
  });

  DestinationsState copyWith({
    Status? status,
    CategoryType? selectedCategory,
    List<Destination>? destinations,
    String? message,
  }) {
    return DestinationsState(
      status: status ?? this.status,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      destinations: destinations ?? this.destinations,
      message: message ?? this.message,
    );
  }
}
