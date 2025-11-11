import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_bloc.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_event.dart';
import 'package:easy_travel/features/auth/presentation/blocs/login_state.dart';
import 'package:easy_travel/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case Status.success:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
            break;
          case Status.failure:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Login failed')),
            );
            break;
          default:
        }
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) =>
                      context.read<LoginBloc>().add(OnEmailChanged(email: value)),
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Email",
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocSelector<LoginBloc, LoginState, bool>(
                  selector: (state) => state.isPasswordVisible,
                  builder: (context, state) => TextField(
                    onChanged: (value) => context.read<LoginBloc>().add(
                      OnPasswordChanged(password: value),
                    ),
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () => context.read<LoginBloc>().add(
                          TogglePasswordVisibility(),
                        ),
                        icon: Icon(state ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                    obscureText: !state,
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => context.read<LoginBloc>().add(Login()),
                    child: Text("Sign in"),
                  ),
                ),
              ),
            ],
          ),

          BlocSelector<LoginBloc, LoginState, bool>(
            selector: (state) => state.status == Status.loading,
            builder: (context, state) {
              if (!state) return SizedBox.shrink();
              return Container(
                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
