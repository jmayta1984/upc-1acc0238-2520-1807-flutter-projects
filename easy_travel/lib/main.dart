import 'package:easy_travel/core/theme.dart';
import 'package:easy_travel/features/auth/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(TextTheme());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
