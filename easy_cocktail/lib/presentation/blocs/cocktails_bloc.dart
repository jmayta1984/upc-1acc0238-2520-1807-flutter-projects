import 'dart:async';

import 'package:easy_cocktail/core/enums/status.dart';
import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/domain/repositories/cocktail_repository.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_event.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailsBloc extends Bloc<CocktailsEvent, CocktailsState> {
  final CocktailRepository repository;
  CocktailsBloc({required this.repository}) : super(CocktailsState()) {
    on<GetAllCocktails>(_getAllCocktails);

    on<QueryChanged>(_queryChanged);

    on<ToggleFavoriteCocktail>(_toggleFavoriteCocktail);
  }

  FutureOr<void> _getAllCocktails(
    GetAllCocktails event,
    Emitter<CocktailsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final List<Cocktail> cocktails = await repository.getAllCocktails(
        state.query,
      );
      emit(state.copyWith(status: Status.success, cocktails: cocktails));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  FutureOr<void> _queryChanged(
    QueryChanged event,
    Emitter<CocktailsState> emit,
  ) {
    emit(state.copyWith(query: event.query));
  }

  FutureOr<void> _toggleFavoriteCocktail(
    ToggleFavoriteCocktail event,
    Emitter<CocktailsState> emit,
  ) async {
    await repository.toggleFavoriteCocktail(event.cocktail);
    final List<Cocktail> updatedCocktails = state.cocktails.map((cocktail) {
      if (cocktail.id == event.cocktail.id) {
        return cocktail.copyWith(isFavorite: !cocktail.isFavorite);
      }
      return cocktail;
    }).toList();
    emit(state.copyWith(cocktails: updatedCocktails));
  }
}
