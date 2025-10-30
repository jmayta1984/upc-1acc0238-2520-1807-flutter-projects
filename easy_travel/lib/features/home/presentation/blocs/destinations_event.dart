abstract class DestinationsEvent {}

class GetDestinationsEvent extends DestinationsEvent {
  String category;
  GetDestinationsEvent({required this.category});
}

class GetAllDestinationsEvent extends DestinationsEvent {}
