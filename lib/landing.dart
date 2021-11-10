import 'package:flutter/material.dart';
import 'constants.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/login');
    });
    return Container(
      color: Constants.lightBlue,
      child: Center(
        child: Image(
          image: AssetImage('images/logo.png'),
        ),
      ),
    );
  }
}
