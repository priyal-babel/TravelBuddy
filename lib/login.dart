import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Iphone11prox2Widget - FRAME

    return Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 328,
              left: 57,
              child: Container(
                  width: 262,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: Color.fromRGBO(97, 192, 196, 1),
                      width: 1,
                    ),
                  ))),
          Positioned(
              top: 397,
              left: 56,
              child: Container(
                  width: 262,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: Color.fromRGBO(97, 192, 196, 1),
                      width: 1,
                    ),
                  ))),
          Positioned(
              top: 407,
              left: 74,
              child: Text(
                'Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(145, 137, 137, 1),
                    fontFamily: 'Roboto',
                    fontSize: 17,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 338,
              left: 75,
              child: Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(145, 137, 137, 1),
                    fontFamily: 'Roboto',
                    fontSize: 17,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 495,
              left: 159,
              child: Text(
                'LOGIN',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Tienne',
                    fontSize: 17,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 154,
              left: 85,
              child: Container(
                  width: 204,
                  height: 173,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'images/Blackandyellowcartretaillogo21.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 539,
              left: 74,
              child: Text(
                'First time? Register now!',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ]));
  }
}
