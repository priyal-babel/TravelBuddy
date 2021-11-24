import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_buddy/home.dart';
import 'login.dart';
import 'landing.dart';
import 'register.dart';
import 'userDetails.dart';
import 'available_users.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/availability': (context) => Available(),
      },
      home: SafeArea(child: Scaffold(body: Landing())),
    );
  }
}
