import 'package:easy_cocktail/core/enums/status.dart';
import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_bloc.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_event.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_state.dart';
import 'package:easy_cocktail/presentation/pages/cocktails_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailsPage extends StatelessWidget {
  const CocktailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) =>
                  context.read<CocktailsBloc>().add(QueryChanged(query: value)),
              onSubmitted: (_) =>
                  context.read<CocktailsBloc>().add(GetAllCocktails()),
            ),
            Expanded(
              child:
                  BlocSelector<
                    CocktailsBloc,
                    CocktailsState,
                    (Status, List<Cocktail>, String?)
                  >(
                    selector: (state) =>
                        (state.status, state.cocktails, state.message),
                    builder: (context, state) {
                      final (status, cocktails, message) = state;
                      switch (status) {
                        case Status.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case Status.failure:
                          return Center(
                            child: Text(message ?? 'Unknown error'),
                          );
                        case Status.success:
                          return CocktailsList(cocktails: cocktails);
                        default:
                          return const Center(child: SizedBox.shrink());
                      }
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
