import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            home: Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('images/logo.png'),
        ),
      ),
    )));
  }
}
