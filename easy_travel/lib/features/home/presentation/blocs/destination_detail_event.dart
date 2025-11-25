import 'package:easy_travel/shared/domain/destination.dart';

abstract class DestinationDetailEvent {
  const DestinationDetailEvent();
}

class LoadDestinationDetail extends DestinationDetailEvent {
  final int id;
  const LoadDestinationDetail({required this.id});
}

class ToggleFavorite extends DestinationDetailEvent {
  final Destination destination;
  const ToggleFavorite({required this.destination});
}

class AddReview extends DestinationDetailEvent {
  final int id;
  final int rating;
  final String comment;

  const AddReview({
    required this.id,
    required this.comment,
    required this.rating,
  });
}
