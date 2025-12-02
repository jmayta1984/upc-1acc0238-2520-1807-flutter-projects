import 'package:easy_cocktail/data/local/cocktail_dao.dart';
import 'package:easy_cocktail/data/remote/cocktail_service.dart';
import 'package:easy_cocktail/data/repositories/cocktail_repository_impl.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_bloc.dart';
import 'package:easy_cocktail/presentation/pages/cocktails_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = CocktailRepositoryImpl(
      service: CocktailService(),
      dao: CocktailDao(),
    );
    return BlocProvider(
      create: (context) => CocktailsBloc(repository: repository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CocktailsPage(),
      ),
    );
  }
}
