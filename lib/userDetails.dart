import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'constants.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatefulWidget {
  @override
  _UserDetails createState() => _UserDetails();
}

class _UserDetails extends State<UserDetails> {
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
