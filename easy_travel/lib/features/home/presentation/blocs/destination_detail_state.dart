import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/review.dart';
import 'package:easy_travel/shared/domain/destination.dart';

class DestinationDetailState {
  final Destination? destination;
  final List<Review> reviews;
  final Status status;
  final String? message;

  const DestinationDetailState({
    this.destination,
    this.reviews = const [],
    this.status = Status.initial,
    this.message,
  });

  DestinationDetailState copyWith({
    Destination? destination,
    List<Review>? reviews,
    Status? status,
    String? message,
  }) {
    return DestinationDetailState(
      destination: destination ?? this.destination,
      reviews: reviews ?? this.reviews,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
