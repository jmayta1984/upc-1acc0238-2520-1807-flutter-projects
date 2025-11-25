import 'package:easy_travel/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:easy_travel/features/auth/presentation/blocs/auth_state.dart';
import 'package:easy_travel/features/auth/presentation/pages/login_page.dart';
import 'package:easy_travel/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        switch (state.status) {
          case AuthStatus.authenticated:
            return const MainPage();
          case AuthStatus.unauthenticated:
            return const LoginPage();
          case AuthStatus.initial:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
        }
      },
    );
  }
}
