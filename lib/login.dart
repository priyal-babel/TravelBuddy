import 'package:flutter/material.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Constants.lightBlue,
                  ),
                  child: Positioned(
                    top: size.height * 0.25,
                    child: Image.asset("images/logo.png"),
                  ))),
          Positioned(
              top: size.height * 0.4,
              left: 0,
              child: Container(
                  width: size.width,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
        ],
      ),
    );
  }
}
