import 'package:easy_travel/features/main/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autocorrect: false,
            controller: _emailController,
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
          child: TextField(
            autocorrect: false,
            controller: _passwordController,
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
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            obscureText: !isVisible,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text("Sign in"),
            ),
          ),
        ),
      ],
    );
  }
}
