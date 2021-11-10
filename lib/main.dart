import 'package:flutter/material.dart';
import 'login.dart';
import 'landing.dart';
import 'register.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/landing': (context) => Landing(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
      home: SafeArea(child: Scaffold(body: Landing())),
    );
  }
}
