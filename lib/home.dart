import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'constants.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Positioned(
          child: Text("Hi"),
        ));
  }
}
