import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_bloc.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailCard({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ClipOval(
          child: Image.network(
            cocktail.posterPath,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(child: Text(cocktail.name)),
        IconButton(
          onPressed: () => context.read<CocktailsBloc>().add(
            ToggleFavoriteCocktail(cocktail: cocktail),
          ),
          icon: Icon(
            cocktail.isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
        ),
      ],
    );
  }
}
