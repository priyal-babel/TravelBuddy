import 'package:flutter/material.dart';

class Iphone11prox1Widget extends StatefulWidget {
  @override
  _Iphone11prox1WidgetState createState() => _Iphone11prox1WidgetState();
}

class _Iphone11prox1WidgetState extends State<Iphone11prox1Widget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Iphone11prox1Widget - FRAME

    return Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 375,
                  height: 426,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(202, 247, 255, 1),
                  ))),
          Positioned(
              top: 375,
              left: 0,
              child: Container(
                  width: 375,
                  height: 437,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              top: 479,
              left: 54,
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
              top: 548,
              left: 53,
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
              top: 558,
              left: 71,
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
              top: 489,
              left: 72,
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
              top: 641,
              left: 119,
              child: Container(
                  width: 131,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color.fromRGBO(202, 247, 255, 1),
                    border: Border.all(
                      color: Color.fromRGBO(97, 192, 196, 1),
                      width: 3,
                    ),
                  ))),
          Positioned(
              top: 650,
              left: 156,
              child: Text(
                'LOGIN',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Tienne',
                    fontSize: 17,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 719,
              left: 54,
              child: Text(
                'Don’t have an account? Sign up',
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
          Positioned(
              top: 163,
              left: 37,
              child: Container(
                  width: 302,
                  height: 199,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle4.png'),
                        fit: BoxFit.fitWidth),
                  ))),
        ]));
  }
}
