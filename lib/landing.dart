import 'package:flutter/material.dart';
import 'constants.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
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
