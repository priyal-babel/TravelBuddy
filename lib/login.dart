import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'package:flutter/gestures.dart';
import 'Services/AuthenticationService.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                      child: Image.asset(
                        "images/logo.png",
                        scale: 1.75,
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
                          width: 1.0,
                          color: (Constants.darkBlue),
                        )),
                    onPressed: () {
                      signInUser(context);
                      // Navigator.pushNamed(context, '/home');
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
                          controller: _emailContoller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 1)),
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
                        controller: _passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.darkBlue, width: 1)),
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

  Future<void> signInUser(BuildContext context) async {
    dynamic authResult =
        await _auth.loginUser(_emailContoller.text, _passwordController.text);
    if (authResult == null) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:
                  Text('Error', style: TextStyle(fontWeight: FontWeight.bold)),
              content: Text("Sign in error, could not login."),
              actions: [
                new TextButton(
                  child: const Text("Ok"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: Text("You have been logged in successfully."),
              actions: [
                new TextButton(
                  child: const Text("OK"),
                  onPressed: () => {
                    Navigator.pop(context),
                    _emailContoller.clear(),
                    _passwordController.clear(),
                    Navigator.pushNamed(context, '/home')
                  },
                ),
              ],
            );
          });
    }
  }
}
