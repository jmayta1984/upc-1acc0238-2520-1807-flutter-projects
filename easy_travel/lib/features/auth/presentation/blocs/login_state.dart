import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/auth/domain/user.dart';

class LoginState {
  final Status status;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String? message;
  final User? user;

  const LoginState({
    this.status = Status.initial,
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.message,
    this.user,
  });

  LoginState copyWith({
    Status? status,
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? message,
    User? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
