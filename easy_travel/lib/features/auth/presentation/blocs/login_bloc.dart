import 'dart:async';
import 'package:easy_travel/features/auth/data/auth_service.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_state.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService service;

  LoginBloc({required this.service}) : super(LoginState()) {
    on<OnEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );

    on<OnPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );

    on<TogglePasswordVisibility>(
      (event, emit) =>
          emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible)),
    );

    on<Login>(_login);
  }

  FutureOr<void> _login(Login login, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final user = await service.login(state.email, state.password);
      emit(state.copyWith(user: user, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
