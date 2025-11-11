import 'dart:async';
import 'package:easy_travel/features/favorites/data/favorite_dao.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_event.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_state.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final FavoriteDao dao;

  FavoriteListBloc({required this.dao}) : super(FavoriteListState()) {
    on<GetAllFavorites>(_getAllFavorites);

    on<RemoveFavorite>(_removeFavorite);
  }

  Future<void> _getAllFavorites(
    GetAllFavorites event,
    Emitter<FavoriteListState> emit,
  ) async {
    final List<Destination> destinations = await dao.fetchAll();
    emit(state.copyWith(destinations: destinations));
  }

  FutureOr<void> _removeFavorite(
    RemoveFavorite event,
    Emitter<FavoriteListState> emit,
  ) async {
    await dao.delete(event.id);
    final List<Destination> destinations = await dao.fetchAll();
    emit(state.copyWith(destinations: destinations));
  }
}
