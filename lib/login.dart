import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'package:flutter/gestures.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: new SingleChildScrollView(
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
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
                        child: Image.asset(
                          "images/logo.png",
                          scale: 1.75,
                        ),
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
              Positioned(
                  top: size.height * 0.75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        primary: Constants.lightBlue,
                        onPrimary: Colors.black,
                        side: BorderSide(
                          width: 2.0,
                          color: (Constants.darkBlue),
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text("LOGIN"),
                  )),
              Positioned(
                  top: size.height * 0.52,
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 300, height: 50),
                    child: Material(
                        elevation: 10,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              hintText: "Email"),
                        )),
                  )),
              Positioned(
                  top: size.height * 0.62,
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 300, height: 50),
                    child: Material(
                      elevation: 10.0,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.darkBlue, width: 2)),
                            hintText: "Password"),
                      ),
                    ),
                  )),
              Positioned(
                  top: size.height * 0.85,
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              color: Constants.darkBlue, fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/signup');
                            }),
                    ]),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
