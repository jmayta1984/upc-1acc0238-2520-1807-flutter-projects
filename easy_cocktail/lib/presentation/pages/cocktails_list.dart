import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/presentation/pages/cocktail_card.dart';
import 'package:flutter/material.dart';

class CocktailsList extends StatelessWidget {
  final List<Cocktail> cocktails;
  const CocktailsList({super.key, required this.cocktails});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cocktails.length,
      itemBuilder: (context, index) {
        final Cocktail cocktail = cocktails[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CocktailCard(cocktail: cocktail),
        );
      },
    );
  }
}
