import 'package:easy_travel/features/auth/domain/user.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  
}

class LoginSuccessState extends LoginState {
  final User user;
  const LoginSuccessState({required this.user});
}