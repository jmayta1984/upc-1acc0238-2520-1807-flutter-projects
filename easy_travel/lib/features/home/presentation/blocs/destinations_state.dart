import 'package:easy_travel/features/home/domain/destination.dart';

enum Status { initial, loading, success, failure }

enum CategoryType {
  all(label: 'All'),
  adventure(label: 'Adventure'),
  beach(label: 'Beach'),
  city(label: 'City'),
  cultural(label: 'Cultural');

  final String label;
  const CategoryType({required this.label});
}

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
