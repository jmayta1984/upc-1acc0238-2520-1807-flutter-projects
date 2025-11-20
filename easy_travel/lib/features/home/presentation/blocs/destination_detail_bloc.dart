import 'dart:async';

import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/data/review_service.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_state.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailBloc
    extends Bloc<DestinationDetailEvent, DestinationDetailState> {
  final DestinationRepository repository;
  final ReviewService service = ReviewService();
  DestinationDetailBloc({required this.repository})
    : super(DestinationDetailState()) {
    on<LoadDestinationDetail>(_loadDestinationDetail);
    on<ToggleFavorite>(_toggleFavorite);
  }

  FutureOr<void> _loadDestinationDetail(
    LoadDestinationDetail event,
    Emitter<DestinationDetailState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final destination = await repository.getDestinationById(id: event.id);
      final reviews = await service.getReviewsByDestination(event.id);
      emit(
        state.copyWith(
          status: Status.success,
          destination: destination,
          reviews: reviews,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  FutureOr<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<DestinationDetailState> emit,
  ) {
    repository.toggleFavorite(event.destination);
    final destination = Destination(
      id: event.destination.id,
      title: event.destination.title,
      posterPath: event.destination.posterPath,
      overview: event.destination.overview,
      isFavorite: !event.destination.isFavorite,
    );
    emit(state.copyWith(destination: destination));
  }
}
