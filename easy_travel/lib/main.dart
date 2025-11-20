import 'package:easy_travel/core/enums/category_type.dart';
import 'package:easy_travel/core/ui/theme.dart';
import 'package:easy_travel/features/auth/data/auth_service.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_bloc.dart';
import 'package:easy_travel/features/auth/presentation/pages/login_page.dart';
import 'package:easy_travel/features/favorites/data/favorite_dao.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorite_list_event.dart';
import 'package:easy_travel/features/home/data/destination_repository_impl.dart';
import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(TextTheme());
    final repository = DestinationRepositoryImpl(
      service: DestinationService(),
      dao: FavoriteDao(),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DestinationsBloc(repository: repository)
                ..add(GetDestinationsByCategory(category: CategoryType.all)),
        ),

        BlocProvider(create: (context) => LoginBloc(service: AuthService())),
        
        BlocProvider(
          create: (context) =>
              FavoriteListBloc(dao: FavoriteDao())..add(GetAllFavorites()),
        ),
       
        BlocProvider(
          create: (context) => DestinationDetailBloc(repository: repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.light(),
        darkTheme: theme.dark(),
        home: Scaffold(body: LoginPage()),
      ),
    );
  }
}
