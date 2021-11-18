import 'package:flutter/material.dart';
import 'package:travel_buddy/home.dart';
// import 'package:travel_buddy/userDetails.dart';
import 'login.dart';
import 'landing.dart';
import 'register.dart';
import 'userDetails.dart';

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
        '/userDetails': (context) => UserDetails(),
        '/home': (context) => Home(),
      },
      home: SafeArea(child: Scaffold(body: Landing())),
    );
  }
}
